import { wfoRepository } from '../../repositories';
import { GetRecordByNameUseCase } from './getRecordByNameUseCase';

const getRecordByNameUseCase = new GetRecordByNameUseCase(wfoRepository);

export { getRecordByNameUseCase };
