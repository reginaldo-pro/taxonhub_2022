import csvParser from 'csv-parser';
import fs from 'fs';
import getStream from 'get-stream';
import ObjectsFromCsv from 'objects-to-csv';
import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { EHttpStatuses } from 'src/modules/http/httpStatus';
import { TaxonomyModel } from 'src/modules/model/Taxonomy';
import { v4 as uuid } from 'uuid';

import { GetTaxonomyByNameUseCase } from '../getTaxonomy/getTaxonomyByNameUseCase';

const headers = ['binomialName'];

interface IBinomialName {
    binomialName: string;
}

class GenerateCSVUseCase {
    private readonly destFolder: string = './tmp/';

    constructor(private getTaxonomyByNameUseCase: GetTaxonomyByNameUseCase) {}

    async execute(entryDataPath: string): Promise<void> {
        const columnNames =
            'Nome pesquisado,' +
            'Nome retornado,' +
            'Nome aceito/sinonimo,' +
            'Sinônimo de,' +
            'Base de dados(FDB/TPL(WFO)),' +
            'Família respectiva da base de dados\n';

        const fileId: string = uuid();
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

    async executeResponse(): Promise<DefaultResponse<unknown>> {
        await this.execute('./test.csv');

        return new DefaultResponse<TaxonomyModel[]>(
            EHttpStatuses.SUCCESS,
            null,
        );
    }
}

export { GenerateCSVUseCase };
