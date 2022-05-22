import csvParser from 'csv-parser';
import fs from 'fs';
import getStream from 'get-stream';
import ObjectsFromCsv from 'objects-to-csv';
import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { EHttpStatuses } from 'src/modules/http/httpStatus';
import { TaxonomyModel } from 'src/modules/model/Taxonomy';
import { EMetaTableValues } from 'src/modules/wfo/enumerators/types';
import { WfoRepository } from 'src/modules/wfo/repositories/implementations/WfoRepository';

import { GetTaxonomyByNameUseCase } from '../getTaxonomy/getTaxonomyByNameUseCase';

const headers = ['binomialName'];

interface IBinomialName {
    binomialName: string;
}

class GenerateCSVUseCase {
    private readonly destFolder: string = './tmp/';

    constructor(
        private getTaxonomyByNameUseCase: GetTaxonomyByNameUseCase,
        private wfoRepository: WfoRepository,
    ) {}

    async execute(entryDataPath: string, userId: string): Promise<void> {
        const columnNames =
            'Nome pesquisado,' +
            'Nome retornado,' +
            'Nome aceito/sinonimo,' +
            'Sinônimo de,' +
            'Base de dados(FDB/TPL(WFO)),' +
            'Família respectiva da base de dados\n';

        const fileId: string = userId;
        const outputFilePath = `${this.destFolder}${fileId}.csv`;

        fs.writeFile(outputFilePath, columnNames, (err) => {
            if (err) {
                console.log(err);
            }
        });

        const data = await getStream.array(
            fs.createReadStream(entryDataPath).pipe(csvParser({ headers })),
        );

        await data.reduce(async (promise, line: IBinomialName) => {
            await promise;

            const { binomialName } = line;

            const returnedSpecies = await this.getTaxonomyByNameUseCase.execute(
                binomialName,
            );

            const colletionOfSpecies: TaxonomyModel[] = [];

            returnedSpecies.forEach((species) => {
                colletionOfSpecies.push(species);
            });

            const csv = new ObjectsFromCsv(colletionOfSpecies);

            await csv.toDisk(outputFilePath, {
                append: true,
            });
        }, Promise.resolve());
    }

    async executeResponse(userId: string): Promise<DefaultResponse<unknown>> {
        this.wfoRepository.updateDatabaseConsistencyStatus(
            EMetaTableValues.inUsage,
        );

        const binomialNames = `${userId}-binomialNames.csv`;

        await this.execute(binomialNames, userId);

        this.wfoRepository.updateDatabaseConsistencyStatus(
            EMetaTableValues.consistent,
        );

        return new DefaultResponse<unknown>(EHttpStatuses.SUCCESS, 'done');
    }
}

export { GenerateCSVUseCase };
