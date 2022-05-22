export enum EMetaTableKeys {
    currentDatabaseVersion = 'wfoVersion',
    databaseConsistencyStatus = 'databaseConsistencyStatus',
    databasePhaseStatus = 'databaseUpdateStatus',
}

export enum EMetaTableValues {
    // for the user
    consistent = 'consistent',
    inconsistent = 'inconsistent',

    // for the system
    stable = 'stable',
    unstable = 'unstable',
    inUsage = 'inUsage',
    errorOnUpdate = 'errorOnUpdate',
    needToCheck = 'needToCheck',
}
