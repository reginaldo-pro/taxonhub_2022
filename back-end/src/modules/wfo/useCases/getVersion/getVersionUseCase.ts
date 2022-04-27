import puppeteer from 'puppeteer';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';

class GetVersionUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    async getVersionFromWebsite() {
        const browser = await puppeteer.launch();
        const page = await browser.newPage();

        await page.goto('http://www.worldfloraonline.org/downloadData', {
            timeout: 60000,
        });

        const data = await page.$$eval('table thead tr td', (tds) =>
            tds.map((td) => {
                return td.textContent;
            }),
        );
        await browser.close();

        const version = data[3];

        return version;
    }

    compareVersion(scrappedVersion: string, savedVersion: string) {
        return scrappedVersion === savedVersion;
    }

    async execute() {
        const versionFromWebsite = await this.getVersionFromWebsite();
        const savedVersion = await this.wfoRepository.getSavedVersion();
        const isUpdated = this.compareVersion(versionFromWebsite, savedVersion);

        const response = {
            versionFromWebsite,
            savedVersion,
            isUpdated,
        };

        return response;
    }
}

export { GetVersionUseCase };
