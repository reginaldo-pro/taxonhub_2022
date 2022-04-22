import { Taxonomy } from '../../../model/Taxonomy';
import { ITaxonomyRepository } from '../ITaxonomyRepository';

class TaxonomyRepository implements ITaxonomyRepository {
    private taxonomies: Taxonomy[];
    private static INSTANCE: TaxonomyRepository;

    private constructor() {
        this.taxonomies = [];
    }

    public static getInstance(): TaxonomyRepository {
        if (!TaxonomyRepository.INSTANCE) {
            TaxonomyRepository.INSTANCE = new TaxonomyRepository();
        }

        return TaxonomyRepository.INSTANCE;
    }

    list(): Taxonomy[] {
        return this.taxonomies;
    }

    findByName(name: string): Taxonomy[] {
        const taxonomies = this.taxonomies.filter(
            (taxonomy) => taxonomy.name === name
        );

        return taxonomies;
    }
}

export { TaxonomyRepository };
