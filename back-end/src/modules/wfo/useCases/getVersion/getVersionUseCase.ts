import puppeteer from 'puppeteer';

class GetVersionUseCase {
    async getVersionFromWebsite() {
        const browser = await puppeteer.launch();
        const page = await browser.newPage();

        await page.goto('http://www.worldfloraonline.org/downloadData', {
            timeout: 0,
        });

        const data = await page.$$eval('table thead tr td', (tds) =>
            tds.map((td) => {
                return td.textContent;
            })
        );
        await browser.close();

        const version = data[3];

        return version;
    }

    getSavedVersion() {
        // change
        return 'v.2021.01';
    }

    compareVersion(scrappedVersion: string, savedVersion: string) {
        return scrappedVersion === savedVersion;
    }

    updateVersion() {
        throw new Error('Not implemented');
    }

    async execute() {
        const scrappedVersion = await this.getVersionFromWebsite();
        const savedVersion = this.getSavedVersion();
        const isUpdated = this.compareVersion(scrappedVersion, savedVersion);

        const response = {
            scrappedVersion,
            savedVersion,
            isUpdated,
        };
        return response;
    }
}

export { GetVersionUseCase };
