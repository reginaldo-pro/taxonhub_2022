import { Request, Response } from 'express';

import { GetVersionUseCase } from './getVersionUseCase';

class GetVersionController {
    constructor(private getVersionUseCase: GetVersionUseCase) {}

    async handle(request: Request, response: Response) {
        try {
            const data = await this.getVersionUseCase.execute();

            return response.status(200).json(data);
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    }

    // todo: Finish this task
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    updateVersion = async (request: Request, response: Response) => {
        try {
            throw new Error('Not implemented');
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    };
}

export { GetVersionController };
