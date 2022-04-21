import { dbClient } from 'src/modules/database/client';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';
import { GetVersionController } from './getVersionController';
import { GetVersionUseCase } from './getVersionUseCase';

const wfoRepository = new WfoRepository(dbClient);
const getVersionUseCase = new GetVersionUseCase(wfoRepository);
const getVersionController = new GetVersionController(getVersionUseCase);

export { getVersionController };
