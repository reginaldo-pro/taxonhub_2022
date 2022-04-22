import { Router } from 'express';
import multer from 'multer';

import { importCSVController } from '../modules/taxonomy/useCases/importCSV';
import { listTaxonomiesController } from '../modules/taxonomy/useCases/listTaxonomies';

const taxonomyRoutes = Router();
const upload = multer({
    dest: './tmp',
    limits: {
        fileSize: 1000000,
    },
});

taxonomyRoutes.get('/', (req, res) => {
    res.send('Hello taxonomy');
});

taxonomyRoutes.get('/list', (req, res) => {
    return listTaxonomiesController.handle(req, res);
});
taxonomyRoutes.post('/import', upload.single('file'), (req, res) => {
    return importCSVController.handle(req, res);
});

export { taxonomyRoutes };
