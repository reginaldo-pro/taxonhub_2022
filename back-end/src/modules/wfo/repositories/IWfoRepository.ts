interface IWfoRepository {
    saveTxtToDB(pathToFile: string): Promise<void>;
    getSavedVersion(): Promise<string>;
    updateVersion(version: string): Promise<void>;
}

export { IWfoRepository };
