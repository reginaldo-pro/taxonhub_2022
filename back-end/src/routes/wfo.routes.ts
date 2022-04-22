import { Router } from 'express';
import { getVersionController } from 'src/modules/wfo/useCases/getVersion';

const wfoRoutes = Router();

wfoRoutes.get('/version', (req, res) => {
    return getVersionController.handle(req, res);
});

export { wfoRoutes };
