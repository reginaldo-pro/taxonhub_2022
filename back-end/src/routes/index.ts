import { Router } from 'express';

import { ocurrencyRoutes } from './ocurrency.routes';
import { taxonomyRoutes } from './taxonomy.routes';

const router = Router();

router.use('/taxonomy', taxonomyRoutes);
router.use('/ocurrency', ocurrencyRoutes);

export { router };
