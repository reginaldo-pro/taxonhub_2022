import { wfoRepository } from '../../repositories';
import { GetDatabaseStatusController } from './getDatabaseStatusController';
import { GetDatabaseStatusUseCase } from './getDatabaseStatusUseCase';

const getDatabaseStatusUseCase = new GetDatabaseStatusUseCase(wfoRepository);
const getDatabaseStatusController = new GetDatabaseStatusController(
    getDatabaseStatusUseCase,
);

export { getDatabaseStatusUseCase };
export { getDatabaseStatusController };
