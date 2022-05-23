import { wfoRepository } from 'src/modules/wfo/repositories';

import { TaxonomyRepository } from '../../repositories/implementations/TaxonomyRepository';
import { GetTaxonomyByNameController } from './getTaxonomyByNameController';
import { GetTaxonomyByNameUseCase } from './getTaxonomyByNameUseCase';

const taxonomyRepository = new TaxonomyRepository(wfoRepository);
const getTaxonomyByNameUseCase = new GetTaxonomyByNameUseCase(
    taxonomyRepository,
);
const getTaxonomyByNameController = new GetTaxonomyByNameController(
    getTaxonomyByNameUseCase,
);

export { getTaxonomyByNameUseCase };
export { getTaxonomyByNameController };
