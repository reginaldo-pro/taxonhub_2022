import AdmZip from 'adm-zip';
import csvParser from 'csv-parser';
import fs from 'fs';
import puppeteer from 'puppeteer';
import { IRecord } from 'src/modules/model/WFORecord';
import request from 'superagent';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';
import { headers } from '../../types';

class UpdateDatabaseUseCase {
    private pathToFolder = './newData';
    private zipFile = 'data.zip';
    private pathToDataFile = this.pathToFolder.concat('/classification.txt');

    constructor(private wfoRepository: WfoRepository) {}

    private async getDownloadLink(): Promise<string> {
        const browser = await puppeteer.launch();
        const page = await browser.newPage();

        await page.goto('http://www.worldfloraonline.org/downloadData', {
            timeout: 180000,
        });

        const pageUrls = await page.evaluate(() => {
            return Array.from(document.links)
                .map((link) => link.href)
                .filter((link) => link.includes('zip'));
        });

        await browser.close();

        return pageUrls[0];
    }

    private setPath(path: string) {
        fs.rmSync(path, { recursive: true, force: true });
        if (!fs.existsSync(path)) fs.mkdirSync(path);
    }

    private async downloadFile(
        link: string,
        pathToFolder: string,
        fullPath: string,
    ) {
        await new Promise((resolve, reject) => {
            request
                .get(link)
                .pipe(fs.createWriteStream(fullPath))
                .on('finish', () => {
                    const zip = new AdmZip(fullPath);
                    zip.extractAllTo(pathToFolder);

                    resolve('Done');
                })
                .on('error', () => {
                    reject(new Error('Could not download file'));
                });
        });
    }

    private async updateDatabase(path: string): Promise<void> {
        await new Promise((resolve, reject) => {
            fs.createReadStream(path)
                .pipe(
                    csvParser({
                        separator: '\t',
                        skipLines: 1,
                        escape: '',
                        quote: '',
                        headers,
                    }),
                )
                .on('data', async (row) => {
                    const data: IRecord = { ...row };

                    const record = await this.wfoRepository.getRecord(
                        data.taxonID,
                    );

                    if (!record) {
                        await this.wfoRepository.saveRecord(data);
                    } else {
                        await this.wfoRepository.updateRecord(data);
                    }
                })
                .on('end', () => {
                    resolve('ok');
                })
                .on('error', () => reject(new Error()));
        });
    }

    async execute(newVersion: string) {
        const link = await this.getDownloadLink();

        this.setPath(this.pathToFolder);

        await this.downloadFile(
            link,
            this.pathToFolder,
            this.pathToFolder.concat('/', this.zipFile),
        );

        // await this.wfoRepository.dropRecordTable();

        await this.updateDatabase(this.pathToDataFile);

        await this.wfoRepository.updateVersion(newVersion);
    }
}

export { UpdateDatabaseUseCase };
