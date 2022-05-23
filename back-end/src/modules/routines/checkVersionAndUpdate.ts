import cron from 'node-cron';

import { EMetaTableValues } from '../wfo/enumerators/types';
import { downloadNewDataUseCase } from '../wfo/useCases/downloadNewData';
import { getDatabaseStatusUseCase } from '../wfo/useCases/getDatabaseStatus';
import { IDBStatus } from '../wfo/useCases/getDatabaseStatus/getDatabaseStatusUseCase';
import { getVersionUseCase } from '../wfo/useCases/getVersion';
import { IVersionData } from '../wfo/useCases/getVersion/types';
import { updateDatabaseUseCase } from '../wfo/useCases/updateDatabase';

const checkVersionAndUpdate = async () => {
    const data: IVersionData = await getVersionUseCase.execute();

    if (!data.isUpdated) {
        await downloadNewDataUseCase.execute();
        await updateDatabaseUseCase.execute(data.versionFromWebsite);
    }
};

const execute = async () => {
    const data: IDBStatus = await getDatabaseStatusUseCase.execute();

    if (
        data.consistencyStatus.value !== EMetaTableValues.inUsage &&
        (data.updateStatus.value === EMetaTableValues.stable ||
            data.updateStatus.value === EMetaTableValues.needToCheck ||
            data.updateStatus.value === EMetaTableValues.errorOnUpdate)
    ) {
        await checkVersionAndUpdate();
    }
};

export default cron.schedule(
    '*/20 * * * *',
    async () => {
        await execute();
    },
    {
        scheduled: false,
    },
);
