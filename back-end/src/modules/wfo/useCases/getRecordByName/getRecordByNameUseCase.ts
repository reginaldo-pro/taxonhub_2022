import { IRecord } from 'src/modules/model/WFORecord';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';

class GetRecordByNameUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    async execute(scientificName: string): Promise<IRecord> {
        const record = await this.wfoRepository.getRecordByName(scientificName);

        return record;
    }
}

export { GetRecordByNameUseCase };
