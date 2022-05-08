import { Request, Response } from 'express';
import { DefaultResponse } from 'src/modules/http/defaultResponse';

import { GenerateCSVUseCase } from './generateCSVUseCase';

class GenerateCSVController {
    constructor(private generateCSVUseCase: GenerateCSVUseCase) {}

    async handle(request: Request, response: Response) {
        const data: DefaultResponse<unknown> =
            await this.generateCSVUseCase.executeResponse();

        return response.status(data.status).json(data);
    }
}

export { GenerateCSVController };
