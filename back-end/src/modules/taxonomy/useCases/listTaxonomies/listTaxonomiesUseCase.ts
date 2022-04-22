import { Taxonomy } from '../../../model/Taxonomy';
import { ITaxonomyRepository } from '../../repositories/ITaxonomyRepository';

class ListTaxonomiesUseCase {
    constructor(private taxonomiesRepository: ITaxonomyRepository) {}

    execute(): Taxonomy[] {
        const taxonomies = this.taxonomiesRepository.list();

        return taxonomies;
    }
}

export { ListTaxonomiesUseCase };
