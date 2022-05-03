import { ITaxonomyRepository } from '../../repositories/ITaxonomyRepository';
import { Taxonomy } from '../../../model/Taxonomy';

class ListTaxonomiesUseCase {
    constructor(private taxonomiesRepository: ITaxonomyRepository){}


     execute(): Taxonomy[] {

        const taxonomies =  this.taxonomiesRepository.list();

        return taxonomies

    }

}


export { ListTaxonomiesUseCase }