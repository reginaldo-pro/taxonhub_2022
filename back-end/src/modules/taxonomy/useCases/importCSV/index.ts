import { TaxonomyRepository } from '../../repositories/implementations/TaxonomyRepository';
import { ImportCSVController } from './importCSVController';
import { ImportCSVUseCase } from './importCSVUseCase';

const taxonomiesRepository = TaxonomyRepository.getInstance();
const importCSVUseCase = new ImportCSVUseCase(taxonomiesRepository);
const importCSVController = new ImportCSVController(importCSVUseCase);

export { importCSVController };
