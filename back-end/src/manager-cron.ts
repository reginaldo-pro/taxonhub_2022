import cron from 'node-cron';

import checkVersionAndUpdate from './modules/routines/checkVersionAndUpdate';

class ManagerCron {
    private jobs: cron.ScheduledTask[];

    constructor() {
        this.jobs = [checkVersionAndUpdate];
    }

    run() {
        this.jobs.forEach((job) => job.start());
    }
}

export default new ManagerCron();
