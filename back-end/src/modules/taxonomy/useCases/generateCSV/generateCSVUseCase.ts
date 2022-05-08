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
    constructor(private getTaxonomyByNameUseCase: GetTaxonomyByNameUseCase) {}

    async execute(): Promise<TaxonomyModel[]> {
        const finalData: TaxonomyModel[] = [];
        const columnNames =
            'Nome pesquisado,Nome retornado,Nome aceito/sinonimo,Sinônimo de,Base de dados(FDB/TPL(WFO)),Família respectiva da base de dados\n';

        const fileId = uuid();

        fs.writeFile(`./tmp/${fileId}.csv`, columnNames, (err) => {
            if (err) {
                console.log(err);
            }
        });

        const data = await getStream.array(
            fs.createReadStream('./test.csv').pipe(csvParser({ headers })),
        );

        await data.reduce(async (promise, line: IBinomialName) => {
            await promise;
            const specie: string = line.binomialName;
            const returnedSpecies = await this.getTaxonomyByNameUseCase.execute(
                specie,
            );
            returnedSpecies.forEach((species) => {
                finalData.push(species);
            });
        }, Promise.resolve());

        const csv = new ObjectsFromCsv(finalData);
        await csv.toDisk(`./tmp/${fileId}.csv`, {
            append: true,
        });

        return finalData;
    }

    async executeResponse(): Promise<DefaultResponse<unknown>> {
        const data = await this.execute();

        return new DefaultResponse<TaxonomyModel[]>(
            EHttpStatuses.SUCCESS,
            data,
        );
    }
}

export { GenerateCSVUseCase };
