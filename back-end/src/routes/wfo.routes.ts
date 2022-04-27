import { Router } from 'express';
import { getVersionController } from 'src/modules/wfo/useCases/getVersion';
import { updateDatabaseController } from 'src/modules/wfo/useCases/updateDatabase';

const wfoRoutes = Router();

wfoRoutes.get('/version', (req, res) => {
    return getVersionController.handle(req, res);
});

wfoRoutes.patch('/update', (req, res) => {
    return updateDatabaseController.handle(req, res);
});

export { wfoRoutes };
