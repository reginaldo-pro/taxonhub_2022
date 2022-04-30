import { wfoRepository } from '../../repositories';
import { UpdateDatabaseUseCase } from './updateDatabaseUseCase';

const updateDatabaseUseCase = new UpdateDatabaseUseCase(wfoRepository);

export { updateDatabaseUseCase };
