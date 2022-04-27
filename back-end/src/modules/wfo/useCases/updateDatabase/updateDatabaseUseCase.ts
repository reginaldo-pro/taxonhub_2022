import AdmZip from 'adm-zip';
import fs from 'fs';
import puppeteer from 'puppeteer';
import request from 'superagent';

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

    private downloadFile(link: string) {
        request
            .get(link)
            .pipe(fs.createWriteStream('./tmp/data.zip'))
            .on('finish', () => {
                const zip = new AdmZip('test.zip');
                zip.extractAllTo('./tmp');
            });
    }

    // eslint-disable-next-line @typescript-eslint/no-empty-function
    async execute() {}
}

export { UpdateDatabaseUseCase };
