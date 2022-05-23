import { meta, PrismaClient } from '@prisma/client';
import { IRecord } from 'src/modules/model/WFORecord';

import { EMetaTableKeys, EMetaTableValues } from '../../enumerators/types';
import { IWfoRepository } from '../IWfoRepository';

class WfoRepository implements IWfoRepository {
    constructor(private prismaClient: PrismaClient) {}

    async getRecordByName(scientificName: string): Promise<IRecord> {
        const record = await this.prismaClient.record.findFirst({
            where: {
                scientificName,
            },
        });

        return record as IRecord;
    }

    async getRecordsByName(scientificName: string): Promise<IRecord[]> {
        const record = await this.prismaClient.record.findMany({
            where: {
                scientificName: {
                    contains: scientificName,
                },
            },
        });

        return record as IRecord[];
    }

    async getManyRecordsByName(scientificNames: string[]): Promise<IRecord[]> {
        const records = await this.prismaClient.record.findMany({
            where: {
                scientificName: {
                    in: scientificNames,
                },
            },
        });

        return records as IRecord[];
    }

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
                key: EMetaTableKeys.currentDatabaseVersion,
            },
            data: {
                value: version,
            },
        });
    }

    private async saveVersion(version: string): Promise<meta> {
        const data = await this.prismaClient.meta.create({
            data: {
                key: EMetaTableKeys.currentDatabaseVersion,
                value: version,
            },
        });

        return data;
    }

    async getSavedVersion(): Promise<string> {
        let data = await this.prismaClient.meta.findUnique({
            where: {
                key: EMetaTableKeys.currentDatabaseVersion,
            },
        });

        if (!data) {
            data = await this.saveVersion('please update!');
        }

        return data.value;
    }

    private async updateMeta(key: string, value: string): Promise<void> {
        await this.prismaClient.meta.update({
            where: {
                key,
            },
            data: {
                value,
            },
        });
    }

    private async saveMeta(key: string, value: string): Promise<meta> {
        const data = await this.prismaClient.meta.create({
            data: {
                key,
                value,
            },
        });

        return data;
    }

    async updateDatabasePhaseStatus(status: string): Promise<void> {
        const data = await this.getDatabaseUpdateStatus();

        await this.updateMeta(data.key, status);
    }

    async updateDatabaseConsistencyStatus(status: string): Promise<void> {
        const data = await this.getDatabaseConsistencyStatus();

        await this.prismaClient.meta.update({
            where: {
                key: data.key,
            },
            data: {
                value: status,
            },
        });
    }

    // dbConsistencyStatus is if the database is good for read or not (for the final user)
    // dbUpdateStatus is if the database has been updated (for the system)
    async getDatabaseConsistencyStatus(): Promise<meta> {
        let dbConsistencyStatus = await this.prismaClient.meta.findUnique({
            where: {
                key: EMetaTableKeys.databaseConsistencyStatus,
            },
        });

        if (!dbConsistencyStatus) {
            dbConsistencyStatus = await this.saveMeta(
                EMetaTableKeys.databaseConsistencyStatus,
                EMetaTableValues.consistent,
            );
        }

        return dbConsistencyStatus;
    }

    async getDatabaseUpdateStatus(): Promise<meta> {
        let dbUpdateStatus = await this.prismaClient.meta.findUnique({
            where: {
                key: EMetaTableKeys.databasePhaseStatus,
            },
        });

        if (!dbUpdateStatus) {
            dbUpdateStatus = await this.saveMeta(
                EMetaTableKeys.databasePhaseStatus,
                EMetaTableValues.stable,
            );
        }

        return dbUpdateStatus;
    }
}

export { WfoRepository };
