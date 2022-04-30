import { wfoRepository } from '../../repositories';
import { GetVersionController } from './getVersionController';
import { GetVersionUseCase } from './getVersionUseCase';

const getVersionUseCase = new GetVersionUseCase(wfoRepository);
const getVersionController = new GetVersionController(getVersionUseCase);

export { getVersionUseCase };
export { getVersionController };
