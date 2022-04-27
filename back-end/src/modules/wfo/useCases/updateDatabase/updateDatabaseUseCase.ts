import AdmZip from 'adm-zip';
import csvParser from 'csv-parser';
import fs from 'fs';
import puppeteer from 'puppeteer';
import { IRecord } from 'src/modules/model/WFORecord';
import request from 'superagent';

import { headers } from '../../repositories/implementations/constants';
import { WfoRepository } from '../../repositories/implementations/WfoRepository';

class UpdateDatabaseUseCase {
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

    private setDownloadPath(path: string) {
        fs.rmSync(path, { recursive: true, force: true });
        if (!fs.existsSync(path)) fs.mkdirSync(path);
    }

    private async downloadFile(
        link: string,
        pathToFolder: string,
        fileName: string,
    ) {
        const path = pathToFolder.concat(fileName);

        await new Promise((resolve, reject) => {
            request
                .get(link)
                .pipe(fs.createWriteStream(path))
                .on('finish', () => {
                    const zip = new AdmZip(path);
                    zip.extractAllTo(pathToFolder);

                    resolve('Done');
                })
                .on('error', () => {
                    reject(new Error('Could not download file'));
                });
        });
    }

    private async updateDatabase(path: string): Promise<void> {
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

                const record = await this.wfoRepository.getRecord(data.taxonID);

                if (!record) {
                    // console.log(
                    //     `Inexistent record. Saving with ID: ${data.taxonID}`,
                    // );
                    await this.wfoRepository.saveRecord(data);
                } else {
                    // console.log(
                    //     `Existing record. Updating with ID: ${data.taxonID}`,
                    // );
                    await this.wfoRepository.updateRecord(data);
                }
            })
            .on('end', () => {
                console.log('finished.');
            });
    }

    async execute() {
        const link = await this.getDownloadLink();
        this.setDownloadPath('./tmp');

        await this.downloadFile(link, './tmp/', 'data.zip');
        await this.updateDatabase('./tmp/classification.txt');
    }
}

export { UpdateDatabaseUseCase };
