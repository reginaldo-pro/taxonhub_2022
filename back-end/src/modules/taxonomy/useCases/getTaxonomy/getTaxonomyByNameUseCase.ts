import puppeteer from 'puppeteer';
import { EDataset, ETaxonomyName } from 'src/modules/model/enumerators/types';
import { TaxonomyModel } from 'src/modules/model/Taxonomy';

import { TaxonomyRepository } from '../../repositories/implementations/TaxonomyRepository';

interface IFetchData {
    name: string;
    status: string;
}

class GetTaxonomyByNameUseCase {
    constructor(private taxonomyRepository: TaxonomyRepository) {}

    private divideIntoChunks(items: string[], size: number) {
        const chunks = [];
        const its = [].concat(...items);

        while (its.length) {
            chunks.push(its.splice(0, size));
        }

        return chunks;
    }

    private async fetchData(link: string): Promise<IFetchData[]> {
        try {
            const browser = await puppeteer.launch();
            const page = await browser.newPage();

            await page.goto(link, { timeout: 180000 });

            const searchedNameData = await page.$$eval('h1 span', (spans) =>
                spans
                    .map((span) => {
                        return span.textContent;
                    })
                    .filter((e) => e),
            );

            const synonyms = await page.evaluate(() => {
                const tds = Array.from(
                    document.querySelectorAll('table tr td'),
                );
                return tds.map((td) => td.textContent).filter((e) => e);
            });

            const chunks = this.divideIntoChunks(synonyms, 4);

            const cleanData = chunks.map((array) => {
                return {
                    name: array[0],
                    status: array[1],
                };
            });

            cleanData.unshift({
                name: searchedNameData[0],
                status: ETaxonomyName.ACCEPTED,
            });

            await browser.close();

            return cleanData;
        } catch (e) {
            console.log(e);

            return null;
        }
    }

    async execute(scientificName: string): Promise<TaxonomyModel[]> {
        const returnedData = await this.taxonomyRepository.getRecordByName(
            scientificName,
        );

        if (returnedData === null) {
            throw new Error(
                `Specie with name ${scientificName} was not found.`,
            );
        }

        const fetchedData = await this.fetchData(returnedData.tplId);

        const taxonomies: TaxonomyModel[] = [];

        const firtInstance = new TaxonomyModel(
            scientificName,
            fetchedData[0].name,
            fetchedData[0].status,
            null,
            EDataset.WFO,
            returnedData.family,
        );

        taxonomies.push(firtInstance);
        fetchedData.shift();

        fetchedData.forEach((taxonomy) => {
            const searchedName = scientificName;
            const returnedName = taxonomy.name;
            const acceptedNameOrSynonym = taxonomy.status;
            const synonymOf = firtInstance.returnedName;
            const dataset = EDataset.WFO;
            const respectiveFamily = returnedData.family;

            const newTaxonomyData = new TaxonomyModel(
                searchedName,
                returnedName,
                acceptedNameOrSynonym,
                synonymOf,
                dataset,
                respectiveFamily,
            );

            taxonomies.push(newTaxonomyData);
        });

        return taxonomies;
    }
}

export { GetTaxonomyByNameUseCase };
