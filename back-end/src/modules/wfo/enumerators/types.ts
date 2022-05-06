export enum EMetaTableKeys {
    currentDatabaseVersion = 'wfoVersion',
    databaseConsistencyStatus = 'databaseConsistencyStatus',
    databasePhaseStatus = 'databaseUpdateStatus',
}

export enum EMetaTableValues {
    stable = 'stable',
    unstable = 'unstable',
    consistent = 'consistent',
    inconsistent = 'inconsistent',

    errorOnUpdate = 'errorOnUpdate',
    needToCheck = 'needToCheck',
}
