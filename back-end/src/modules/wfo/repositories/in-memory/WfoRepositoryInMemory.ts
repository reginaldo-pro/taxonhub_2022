import { meta } from "@prisma/client";
import { IRecord } from "src/modules/model/WFORecord";
import { IWfoRepository } from "../IWfoRepository";

class WfoRepositoryInMemory implements IWfoRepository {


    dados: IRecord[] = [];
    getSavedVersion(): Promise<string> {
        throw new Error("Method not implemented.");
    }
    updateVersion(version: string): Promise<void> {
        throw new Error("Method not implemented.");
    }
    getRecord(taxonID: string): Promise<IRecord> {
        throw new Error("Method not implemented.");
    }
    getRecordByName(scientificName: string): Promise<IRecord> {
        const record = this.dados.find(
            (taxonomy) => taxonomy.scientificName === scientificName,
        );
        return Promise.resolve(record);
    }
    getRecordsByName(scientificName: string): Promise<IRecord[]> {
        throw new Error("Method not implemented.");
    }
    saveRecord(data: IRecord): Promise<void> {
        throw new Error("Method not implemented.");
    }
    updateRecord(data: IRecord): Promise<void> {
        throw new Error("Method not implemented.");
    }
    dropRecordTable(): Promise<void> {
        throw new Error("Method not implemented.");
    }
    updateDatabasePhaseStatus(status: string): Promise<void> {
        throw new Error("Method not implemented.");
    }
    updateDatabaseConsistencyStatus(status: string): Promise<void> {
        throw new Error("Method not implemented.");
    }
    getDatabaseConsistencyStatus(): Promise<meta> {
        throw new Error("Method not implemented.");
    }
    getDatabaseUpdateStatus(): Promise<meta> {
        throw new Error("Method not implemented.");
    }
    getManyRecordsByName() {
        throw new Error("Method not implemented.");
    }
    saveVersion(){
        throw new Error("Method not implemented.");
    }
    updateMeta(){
        throw new Error("Method not implemented.");
    }
    saveMeta(){
        throw new Error("Method not implemented.");
    }



}

export { WfoRepositoryInMemory };