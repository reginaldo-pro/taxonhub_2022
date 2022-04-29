import { dbClient } from 'src/modules/database/client';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';
import { UpdateDatabaseUseCase } from './updateDatabaseUseCase';

const wfoRepository = new WfoRepository(dbClient);
const updateDatabaseUseCase = new UpdateDatabaseUseCase(wfoRepository);

export { updateDatabaseUseCase };
