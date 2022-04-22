import { Request, Response } from 'express';

import { ImportCSVUseCase } from './importCSVUseCase';

class ImportCSVController {
    constructor(private importCategoryUseCase: ImportCSVUseCase) {}
    handle(request: Request, response: Response): Response {
        const { file } = request;

        this.importCategoryUseCase.execute(file); // faz a busca

        return response.send();
    }
}

export { ImportCSVController };
