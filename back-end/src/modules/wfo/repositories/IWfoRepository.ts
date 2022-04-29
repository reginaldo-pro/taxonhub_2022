import { IRecord } from 'src/modules/model/WFORecord';

interface IWfoRepository {
    getSavedVersion(): Promise<string>;
    updateVersion(version: string): Promise<void>;
    getRecord(taxonID: string): Promise<IRecord>;
    saveRecord(data: IRecord): Promise<void>;
    updateRecord(data: IRecord): Promise<void>;
    dropRecordTable(): Promise<void>;
}

export { IWfoRepository };
