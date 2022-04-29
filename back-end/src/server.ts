import express from 'express';

import managerCron from './manager-cron';
import { router } from './routes';

const app = express();
const port = 3333;

app.use(express.json());
app.use(router);

app.get('/', (_, res) => res.send('API UP'));

app.listen(port, () => {
    console.log(`Server running on port ${port}`);

    managerCron.run();
});
