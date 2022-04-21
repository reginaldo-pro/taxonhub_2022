import { PrismaClient } from '@prisma/client';
import csvParser from 'csv-parser';
import fs from 'fs';
import { IRecord } from 'src/modules/model/WFORecord';

import { IWfoRepository } from '../IWfoRepository';
import { headers } from './constants';

class WfoRepository implements IWfoRepository {
    constructor(private prismaClient: PrismaClient) {}

    async saveTxtToDB(): Promise<void> {
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

    async getSavedVersion(): Promise<string> {
        let data = await this.prismaClient.meta.findUnique({
            where: {
                key: 'wfoVersion',
            },
        });

        if (!data) {
            data = await this.prismaClient.meta.create({
                data: {
                    key: 'wfoVersion',
                    value: 'v.2021.01',
                },
            });
        }

        return data.value;
    }
}

export { WfoRepository };
