import { Request, Response } from 'express';

import { SaveCSVtoDBUseCase } from './saveCSVtoDBUseCase';

class SaveCSVtoDBController {
    constructor(private saveCSVtoDBUseCase: SaveCSVtoDBUseCase) {}

    handle(request: Request, response: Response): Response {
        this.saveCSVtoDBUseCase.execute();

        return response.status(200).json();
    }
}

export { SaveCSVtoDBController };
