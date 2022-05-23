import { IRecord } from 'src/modules/model/WFORecord';
import { WfoRepository } from 'src/modules/wfo/repositories/implementations/WfoRepository';

import { ITaxonomyRepository } from '../ITaxonomyRepository';

class TaxonomyRepository implements ITaxonomyRepository {
    constructor(private wfoRepository: WfoRepository) {}

    async getRecordByName(scientificName: string): Promise<IRecord> {
        return this.wfoRepository.getRecordByName(scientificName);
    }
}

export { TaxonomyRepository };
