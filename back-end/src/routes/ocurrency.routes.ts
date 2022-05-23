import { Router } from 'express';
import multer from 'multer';

const ocurrencyRoutes = Router();

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const upload = multer({
    dest: './tmp',
    limits: {
        fileSize: 1000000,
    },
});

ocurrencyRoutes.get('/', (req, res) => {
    res.send('Hello ocurrency');
});

export { ocurrencyRoutes };
