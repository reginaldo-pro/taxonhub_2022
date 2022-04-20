import { GetVersionController } from './getVersionController';
import { GetVersionUseCase } from './getVersionUseCase';

const getVersionUseCase = new GetVersionUseCase();
const getVersionController = new GetVersionController(getVersionUseCase);

export { getVersionController };
