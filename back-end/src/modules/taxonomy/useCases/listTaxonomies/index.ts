import { TaxonomyRepository } from '../../repositories/implementations/TaxonomyRepository';
import { ListTaxonomiesController } from './listTaxonomiesController';
import { ListTaxonomiesUseCase } from './listTaxonomiesUseCase';

const taxonomiesRepository = TaxonomyRepository.getInstance();
const listTaxonomiesUseCase = new ListTaxonomiesUseCase(taxonomiesRepository);
const listTaxonomiesController = new ListTaxonomiesController(
    listTaxonomiesUseCase
);

export { listTaxonomiesController };
