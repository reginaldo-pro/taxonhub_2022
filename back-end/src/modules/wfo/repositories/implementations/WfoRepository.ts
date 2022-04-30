import { meta, PrismaClient } from '@prisma/client';
import { IRecord } from 'src/modules/model/WFORecord';

import { IWfoRepository } from '../IWfoRepository';

class WfoRepository implements IWfoRepository {
    constructor(private prismaClient: PrismaClient) {}

    async getRecord(taxonID: string): Promise<IRecord> {
        const record = await this.prismaClient.record.findUnique({
            where: {
                taxonID,
            },
        });

        return record as IRecord;
    }

    async dropRecordTable(): Promise<void> {
        await this.prismaClient.record.deleteMany({});
    }

    async saveRecord(data: IRecord): Promise<void> {
        await this.prismaClient.record.create({
            data: { ...data },
        });
    }

    async updateRecord(data: IRecord): Promise<void> {
        await this.prismaClient.record.update({
            where: {
                taxonID: data.taxonID,
            },
            data: {
                ...data,
            },
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
            data = await this.saveVersion('please update!');
        }

        return data.value;
    }

    async updateDatabaseStatus(status: string): Promise<void> {
        await this.prismaClient.meta.update({
            where: {
                key: 'dbStatus',
            },
            data: {
                value: status,
            },
        });
    }

    private async saveDatabaseStatus(version: string): Promise<meta> {
        const data = await this.prismaClient.meta.create({
            data: {
                key: 'dbStatus',
                value: version,
            },
        });

        return data;
    }

    async getDatabaseStatus(): Promise<string> {
        let data = await this.prismaClient.meta.findUnique({
            where: {
                key: 'dbStatus',
            },
        });

        if (!data) {
            data = await this.saveDatabaseStatus('stable');
        }

        return data.value;
    }
}

export { WfoRepository };
