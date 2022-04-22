interface IWfoRepository {
    saveTxtToDB(): Promise<void>;
    getSavedVersion(): Promise<string>;
}

export { IWfoRepository };
