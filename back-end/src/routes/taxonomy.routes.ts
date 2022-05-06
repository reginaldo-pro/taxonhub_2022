/* eslint-disable @typescript-eslint/no-unused-vars */
import { Router } from 'express';
import multer from 'multer';
import { getTaxonomyByNameController } from 'src/modules/taxonomy/useCases/getTaxonomy';

// import { importCSVController } from '../modules/taxonomy/useCases/importCSV';

const taxonomyRoutes = Router();
const upload = multer({
    dest: './tmp',
    limits: {
        fileSize: 1000000,
    },
});

taxonomyRoutes.get('/', (_req, res) => {
    res.send('Hello taxonomy');
});

taxonomyRoutes.get('/specie', (req, res) => {
    return getTaxonomyByNameController.handle(req, res);
});

// taxonomyRoutes.post('/import', upload.single('file'), (req, res) => {
//     return importCSVController.handle(req, res);
// });

export { taxonomyRoutes };
