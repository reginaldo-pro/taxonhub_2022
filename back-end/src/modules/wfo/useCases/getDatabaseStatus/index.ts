import { dbClient } from 'src/modules/database/client';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';
import { GetDatabaseStatusController } from './getDatabaseStatusController';
import { GetDatabaseStatusUseCase } from './getDatabaseStatusUseCase';

const wfoRepository = new WfoRepository(dbClient);
const getDatabaseStatusUseCase = new GetDatabaseStatusUseCase(wfoRepository);
const getDatabaseStatusController = new GetDatabaseStatusController(
    getDatabaseStatusUseCase,
);

export { getDatabaseStatusUseCase };
export { getDatabaseStatusController };
