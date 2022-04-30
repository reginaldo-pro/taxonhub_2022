import cron from 'node-cron';

import { getDatabaseStatusUseCase } from '../wfo/useCases/getDatabaseStatus';
import { getVersionUseCase } from '../wfo/useCases/getVersion';
import { IVersionData } from '../wfo/useCases/getVersion/types';
import { updateDatabaseUseCase } from '../wfo/useCases/updateDatabase';

const checkVersionAndUpdate = async () => {
    const data: IVersionData = await getVersionUseCase.execute();
    console.log(data);

    if (!data.isUpdated) {
        await updateDatabaseUseCase.execute(data.versionFromWebsite);
    }
};

export const execute = async () => {
    const status = await getDatabaseStatusUseCase.execute();

    console.log(status);

    if (status === 'stable') {
        await checkVersionAndUpdate();
    }
};

export default cron.schedule(
    '*/2 * * * *',
    async () => {
        await execute();
    },
    {
        scheduled: false,
    },
);
