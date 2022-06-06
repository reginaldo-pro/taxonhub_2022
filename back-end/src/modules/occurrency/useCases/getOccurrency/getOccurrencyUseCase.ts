import csvParser from 'csv-parser';
import fs from 'fs';
import getStream from 'get-stream';
import ObjectsFromCsv from 'objects-to-csv';
import { FILES_FOLDER } from 'src/modules/config/constants';
import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { GBIF_OCCURENCE_API } from 'src/modules/http/gbifClient';
import { EHttpStatuses } from 'src/modules/http/httpStatus';
import { EDataset } from 'src/modules/model/enumerators/types';

const headers = ['binomialName'];

interface IBinomialName {
    binomialName: string;
}

interface IGbifOccurrence {
    scientificName: string;
    acceptedScientificName: string;
    family: string;
    country: string;
    year: number;
    month: number;
    day: number;
    decimalLatitude: number;
    decimalLongitude: number;
}

const sleep = (ms: number) =>
    new Promise((r) => {
        setTimeout(r, ms);
    });

class GetOccurrencyUseCase {
    async execute(entryDataPath: string, userId: string): Promise<string> {
        const columnNames =
            'nome de entrada,' +
            'nome encontrado,' +
            'nome aceito,' +
            'base de dados,' +
            'familia,' +
            'pais,' +
            'ano,' +
            'mes,' +
            'dia,' +
            'latitude,' +
            'longitude\n';

        const fileId: string = userId;
        const outputFilePath = `${FILES_FOLDER}${fileId}-occurrency.csv`;

        fs.writeFile(outputFilePath, columnNames, (err) => {
            if (err) {
                console.log(err);
            }
        });

        const data = await getStream.array(
            fs
                .createReadStream(entryDataPath)
                .pipe(csvParser({ headers, skipLines: 1 })),
        );

        await data.reduce(async (promise, line: IBinomialName) => {
            await promise;

            const { binomialName } = line;

            const limit = 300;
            const count = await this.getCount(binomialName);

            const resultPromise = [];

            for (let offset = 0; offset < count; offset += limit) {
                resultPromise.push(
                    this.getDataFromGbifAPI(offset, limit, binomialName),
                );
            }

            const result = await Promise.all(resultPromise);

            const allData = result.flat();

            const csv = new ObjectsFromCsv(allData);

            await csv.toDisk(outputFilePath, {
                append: true,
            });
        }, Promise.resolve());

        return outputFilePath;
    }

    private async getDataFromGbifAPI(
        offset: number,
        limit: number,
        binomialName: string,
    ) {
        try {
            await sleep(offset);

            const {
                data: { results },
            } = await GBIF_OCCURENCE_API.get('/search', {
                params: {
                    scientificName: binomialName,
                    offset,
                    limit,
                },
            });

            if (!results) {
                await sleep(offset);

                return this.getDataFromGbifAPI(offset, limit, binomialName);
            }

            const filteredResults = [];

            results.forEach((result: IGbifOccurrence) => {
                if (result.decimalLatitude && result.decimalLongitude) {
                    if (
                        result.decimalLatitude !== 0 &&
                        result.decimalLongitude !== 0
                    )
                        filteredResults.push({
                            entryName: binomialName,
                            foundName: result.scientificName,
                            acceptedName: result.acceptedScientificName,
                            dataset: EDataset.GBIF,
                            family: result.family,
                            country: result.country,
                            year: result.year,
                            month: result.month,
                            day: result.day,
                            latitude: result.decimalLatitude,
                            longitude: result.decimalLongitude,
                        });
                }
            });

            return filteredResults;
        } catch {
            console.log(
                'problem on specie with name:',
                binomialName,
                'at offset',
                offset,
            );

            return [];
        }
    }

    private async getCount(binomialName: string): Promise<number> {
        const {
            data: { count },
        } = await GBIF_OCCURENCE_API.get('/search', {
            params: {
                scientificName: binomialName,
                limit: 1,
            },
        });

        return count;
    }

    async executeResponse(userId: string) {
        const binomialNames = `${FILES_FOLDER}${userId}-binomialNames.csv`;

        const path = await this.execute(binomialNames, userId);

        return new DefaultResponse<string>(EHttpStatuses.SUCCESS, path);
    }
}

export { GetOccurrencyUseCase };
