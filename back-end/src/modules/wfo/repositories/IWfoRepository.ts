import { IRecord } from 'src/modules/model/WFORecord';

interface IWfoRepository {
    saveTxtToDB(pathToFile: string): Promise<void>;
    getSavedVersion(): Promise<string>;
    updateVersion(version: string): Promise<void>;
    getRecord(taxonID: string): Promise<IRecord>;
    saveRecord(data: IRecord): Promise<void>;
    updateRecord(data: IRecord): Promise<void>;
}

export { IWfoRepository };
