import { wfoRepository } from 'src/modules/wfo/repositories';

import { getTaxonomyByNameUseCase } from '../getTaxonomy';
import { GenerateCSVController } from './generateCSVController';
import { GenerateCSVUseCase } from './generateCSVUseCase';

const generateCSVUseCase = new GenerateCSVUseCase(
    getTaxonomyByNameUseCase,
    wfoRepository,
);
const generateCSVController = new GenerateCSVController(generateCSVUseCase);

export { generateCSVUseCase };
export { generateCSVController };
