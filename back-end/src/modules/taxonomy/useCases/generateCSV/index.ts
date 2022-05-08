import { getTaxonomyByNameUseCase } from '../getTaxonomy';
import { GenerateCSVController } from './generateCSVController';
import { GenerateCSVUseCase } from './generateCSVUseCase';

const generateCSVUseCase = new GenerateCSVUseCase(getTaxonomyByNameUseCase);
const generateCSVController = new GenerateCSVController(generateCSVUseCase);

export { generateCSVUseCase };
export { generateCSVController };
