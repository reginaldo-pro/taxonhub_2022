import cron from 'node-cron';

import { EMetaTableValues } from '../wfo/repositories/types';
import { getDatabaseStatusUseCase } from '../wfo/useCases/getDatabaseStatus';
import { getVersionUseCase } from '../wfo/useCases/getVersion';
import { IVersionData } from '../wfo/useCases/getVersion/types';
import { updateDatabaseUseCase } from '../wfo/useCases/updateDatabase';

const checkVersionAndUpdate = async () => {
    const data: IVersionData = await getVersionUseCase.execute();

    console.log(data);

    if (!data.isUpdated) {
        // await downloadNewDataUseCase.execute();
        await updateDatabaseUseCase.execute(data.versionFromWebsite);
    }
};

export const execute = async () => {
    const data = await getDatabaseStatusUseCase.execute();

    console.log(data);

    if (
        data.updateStatus.value === EMetaTableValues.stable ||
        data.updateStatus.value === EMetaTableValues.needToCheck ||
        data.updateStatus.value === EMetaTableValues.errorOnUpdate
    ) {
        await checkVersionAndUpdate();
    }
};

export default cron.schedule(
    '*/1 * * * *',
    async () => {
        await execute();
    },
    {
        scheduled: false,
    },
);
