import express from 'express';

import { router } from './routes';

const app = express();
app.use(express.json());
app.use(router);

app.get('/', (_, res) => res.send('Hello mundo'));

app.listen('3333');
