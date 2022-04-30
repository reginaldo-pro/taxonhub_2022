import { WfoRepository } from '../../repositories/implementations/WfoRepository';

class GetDatabaseStatusUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    async execute() {
        const status = await this.wfoRepository.getDatabaseStatus();

        return status;
    }
}

export { GetDatabaseStatusUseCase };
