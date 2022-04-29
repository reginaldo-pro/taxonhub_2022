import puppeteer from 'puppeteer';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';
import { IVersionData } from './types';

class GetVersionUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    private async getVersionFromWebsite(): Promise<string> {
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

    private compareVersion(
        scrappedVersion: string,
        savedVersion: string,
    ): boolean {
        return scrappedVersion === savedVersion;
    }

    async execute(): Promise<IVersionData> {
        const versionFromWebsite = await this.getVersionFromWebsite();
        const savedVersion = await this.wfoRepository.getSavedVersion();
        const isUpdated = this.compareVersion(versionFromWebsite, savedVersion);

        const response: IVersionData = {
            versionFromWebsite,
            savedVersion,
            isUpdated,
        };

        return response;
    }
}

export { GetVersionUseCase };
