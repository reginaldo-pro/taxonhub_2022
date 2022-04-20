import express from 'express';

import { router } from './routes';

const app = express();
const port = 3333;

app.use(express.json());
app.use(router);

app.get('/', (_, res) => res.send('Hello mundo'));

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
