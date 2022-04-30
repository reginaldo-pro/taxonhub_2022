import { WfoRepository } from '../../repositories/implementations/WfoRepository';

class GetDatabaseStatusUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    async execute() {
        const consistencyStatus =
            await this.wfoRepository.getDatabaseConsistencyStatus();

        const updateStatus = await this.wfoRepository.getDatabaseUpdateStatus();

        return { consistencyStatus, updateStatus };
    }
}

export { GetDatabaseStatusUseCase };
