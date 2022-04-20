import { Router } from 'express';
import { saveCSVtoDBController } from 'src/modules/wfo/useCases/saveCSVtoDB';

const wfoRoutes = Router();

wfoRoutes.post('/savetodb', (req, res) => {
    return saveCSVtoDBController.handle(req, res);
});

export { wfoRoutes };
