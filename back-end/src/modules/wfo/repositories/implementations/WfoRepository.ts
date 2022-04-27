import { meta, PrismaClient } from '@prisma/client';
import csvParser from 'csv-parser';
import fs from 'fs';
import { IRecord } from 'src/modules/model/WFORecord';

import { IWfoRepository } from '../IWfoRepository';
import { headers } from './constants';

class WfoRepository implements IWfoRepository {
    constructor(private prismaClient: PrismaClient) {}

    async saveTxtToDB(pathToFile: string): Promise<void> {
        fs.createReadStream(pathToFile)
            .pipe(
                csvParser({
                    separator: '\t',
                    skipLines: 1,
                    escape: '',
                    quote: '',
                    headers,
                }),
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

    async updateVersion(version: string): Promise<void> {
        await this.prismaClient.meta.update({
            where: {
                key: 'wfoVersion',
            },
            data: {
                value: version,
            },
        });
    }

    async updateRecord(newRecord: IRecord): Promise<void> {
        await this.prismaClient.record.update({
            where: {
                taxonID: newRecord.taxonID,
            },
            data: {
                ...newRecord,
            },
        });
    }

    private async saveVersion(version: string): Promise<meta> {
        const data = await this.prismaClient.meta.create({
            data: {
                key: 'wfoVersion',
                value: version,
            },
        });

        return data;
    }

    async getSavedVersion(): Promise<string> {
        let data = await this.prismaClient.meta.findUnique({
            where: {
                key: 'wfoVersion',
            },
        });

        if (!data) {
            data = await this.saveVersion('v.2021.01');
        }

        return data.value;
    }
}

export { WfoRepository };
