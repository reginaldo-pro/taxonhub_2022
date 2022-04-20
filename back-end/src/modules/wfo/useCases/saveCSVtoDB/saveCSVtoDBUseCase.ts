import { PrismaClient } from '@prisma/client';
import csvParser from 'csv-parser';
import fs from 'fs';
import { IRecord } from 'src/modules/model/WFORecord';

import { headers } from './constants';

class SaveCSVtoDBUseCase {
    constructor(private prismaClient: PrismaClient) {}

    execute() {
        fs.createReadStream('./classification.txt')
            .pipe(
                csvParser({
                    separator: '\t',
                    skipLines: 1,
                    escape: '',
                    quote: '',
                    headers,
                })
            )
            .on('data', async (row) => {
                const data: IRecord = { ...row };

                await this.prismaClient.record.create({
                    data: { ...data },
                });
            })
            .on('end', () => {
                console.log('finished.');
            });
    }
}

export { SaveCSVtoDBUseCase };
