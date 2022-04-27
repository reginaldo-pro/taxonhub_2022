import { Request, Response } from 'express';

import { GetVersionUseCase } from './getVersionUseCase';
import { IVersionData } from './types';

class GetVersionController {
    constructor(private getVersionUseCase: GetVersionUseCase) {}

    async handle(_request: Request, response: Response) {
        try {
            const data: IVersionData = await this.getVersionUseCase.execute();

            return response.status(200).json(data);
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    }
}

export { GetVersionController };
