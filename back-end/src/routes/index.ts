import { Router } from 'express';

import { ocurrencyRoutes } from './ocurrency.routes';
import { taxonomyRoutes } from './taxonomy.routes';
import { wfoRoutes } from './wfo.routes';

const router = Router();

router.use('/taxonomy', taxonomyRoutes);
router.use('/ocurrency', ocurrencyRoutes);
router.use('/wfo', wfoRoutes);

export { router };
