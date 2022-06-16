import { Router } from 'express';
import multer from 'multer';
import { FILES_FOLDER } from 'src/modules/config/constants';
import { generateCSVController } from 'src/modules/taxonomy/useCases/generateCSV';
import { importBinomialNameCSVController } from 'src/modules/taxonomy/useCases/importBinomialNameCSV';

const taxonomyRoutes = Router();

const storage = multer.diskStorage({
    destination: FILES_FOLDER,
    filename(req, file, cb) {
        const { userId } = req.body;
        cb(null, `${userId}-binomialNames.csv`);
    },
});

const upload = multer({
    storage,
});

taxonomyRoutes.get('/generatecsv', (req, res) => {
    return generateCSVController.handle(req, res);
});

taxonomyRoutes.post('/import', upload.single('file'), (req, res) => {
    return importBinomialNameCSVController.handle(req, res);
});

taxonomyRoutes.get('/download', (req, res) => {
    const { userId } = req.query;
    res.download(`${FILES_FOLDER}/${userId}-taxonomy.csv`);
}
);

export { taxonomyRoutes };
