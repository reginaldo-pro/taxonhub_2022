import { Request, Response } from 'express';

import { UpdateDatabaseUseCase } from './updateDatabaseUseCase';

class UpdateDatabaseController {
    constructor(private updateDatabaseUseCase: UpdateDatabaseUseCase) {}

    async handle(request: Request, response: Response) {
        try {
            await this.updateDatabaseUseCase.execute();

            return response.status(200).json({});
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    }
}

export { UpdateDatabaseController };
