import { Router } from 'express';
import { getDatabaseStatusController } from 'src/modules/wfo/useCases/getDatabaseStatus';
import { getVersionController } from 'src/modules/wfo/useCases/getVersion';

const wfoRoutes = Router();

wfoRoutes.get('/version', (req, res) => {
    return getVersionController.handle(req, res);
});

wfoRoutes.get('/dbstatus', (req, res) => {
    return getDatabaseStatusController.handle(req, res);
});

export { wfoRoutes };
