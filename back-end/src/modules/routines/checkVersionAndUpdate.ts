import cron from 'node-cron';

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

export default cron.schedule(
    '0 0 * * 0',
    async () => {
        checkVersionAndUpdate();
    },
    {
        scheduled: false,
    },
);
