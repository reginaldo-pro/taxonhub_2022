import { Request, Response } from 'express';

import { GetDatabaseStatusUseCase } from './getDatabaseStatusUseCase';

class GetDatabaseStatusController {
    constructor(private getDatabaseStatusUseCase: GetDatabaseStatusUseCase) {}

    async handle(_request: Request, response: Response) {
        try {
            const data = await this.getDatabaseStatusUseCase.execute();

            return response.status(200).json(data);
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    }
}

export { GetDatabaseStatusController };
