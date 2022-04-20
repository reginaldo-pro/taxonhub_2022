import { Router } from 'express';
import { getVersionController } from 'src/modules/wfo/useCases/getVersion';
import { saveCSVtoDBController } from 'src/modules/wfo/useCases/saveCSVtoDB';

const wfoRoutes = Router();

wfoRoutes.post('/savetodb', (req, res) => {
    return saveCSVtoDBController.handle(req, res);
});

wfoRoutes.get('/version', (req, res) => {
    return getVersionController.handle(req, res);
});

export { wfoRoutes };
