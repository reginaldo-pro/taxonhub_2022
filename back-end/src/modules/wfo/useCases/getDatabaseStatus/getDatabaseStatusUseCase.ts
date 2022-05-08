import { meta } from '@prisma/client';
import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { EHttpStatuses } from 'src/modules/http/httpStatus';

import { WfoRepository } from '../../repositories/implementations/WfoRepository';

export interface IDBStatus {
    consistencyStatus: meta;
    updateStatus: meta;
}

class GetDatabaseStatusUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    async execute(): Promise<IDBStatus> {
        try {
            const consistencyStatus =
                await this.wfoRepository.getDatabaseConsistencyStatus();

            const updateStatus =
                await this.wfoRepository.getDatabaseUpdateStatus();

            return { consistencyStatus, updateStatus };
        } catch (e: unknown) {
            if (e instanceof Error) {
                throw new Error(e.message);
            }
        }

        return null;
    }

    async executeResponse(): Promise<DefaultResponse<unknown>> {
        try {
            const response: IDBStatus = await this.execute();

            return new DefaultResponse<IDBStatus>(
                EHttpStatuses.SUCCESS,
                response,
            );
        } catch (e) {
            return new DefaultResponse<string>(
                EHttpStatuses.INTERNAL_SERVER_ERROR,
                e.message,
            );
        }
    }
}

export { GetDatabaseStatusUseCase };
