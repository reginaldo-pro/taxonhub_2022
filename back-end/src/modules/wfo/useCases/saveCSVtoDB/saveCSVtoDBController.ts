import { Request, Response } from 'express';

import { SaveCSVtoDBUseCase } from './saveCSVtoDBUseCase';

class SaveCSVtoDBController {
    constructor(private saveCSVtoDBUseCase: SaveCSVtoDBUseCase) {}

    handle(request: Request, response: Response): Response {
        try {
            this.saveCSVtoDBUseCase.execute();

            return response.status(200).json();
        } catch (e) {
            return response.status(500).json(e.message);
        }
    }
}

export { SaveCSVtoDBController };
