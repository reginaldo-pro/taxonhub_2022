import { meta } from '@prisma/client';
import { IRecord } from 'src/modules/model/WFORecord';

interface IWfoRepository {
    getSavedVersion(): Promise<string>;
    updateVersion(version: string): Promise<void>;

    getRecord(taxonID: string): Promise<IRecord>;
    getRecordByName(scientificName: string): Promise<IRecord>;
    getRecordsByName(scientificName: string): Promise<IRecord[]>;
    saveRecord(data: IRecord): Promise<void>;
    updateRecord(data: IRecord): Promise<void>;

    dropRecordTable(): Promise<void>;

    updateDatabasePhaseStatus(status: string): Promise<void>;
    updateDatabaseConsistencyStatus(status: string): Promise<void>;
    getDatabaseConsistencyStatus(): Promise<meta>;
    getDatabaseUpdateStatus(): Promise<meta>;
}

export { IWfoRepository };
