import { IRecord } from 'src/modules/model/WFORecord';

interface ITaxonomyRepository {
    getRecordByName(scientificName: string): Promise<IRecord>;
}

export { ITaxonomyRepository };
