import { Router } from 'express';
import { getOccurrencyController } from 'src/modules/occurrency/useCases/getOccurrency';

const ocurrencyRoutes = Router();

ocurrencyRoutes.get('/generatecsv', (req, res) => {
    return getOccurrencyController.handle(req, res);
});

export { ocurrencyRoutes };
