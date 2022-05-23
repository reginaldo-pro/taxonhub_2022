import { Request, Response } from 'express';
import { DefaultResponse } from 'src/modules/http/defaultResponse';

import { GenerateCSVUseCase } from './generateCSVUseCase';

class GenerateCSVController {
    constructor(private generateCSVUseCase: GenerateCSVUseCase) {}

    async handle(request: Request, response: Response) {
        const { userId } = request.body;

        const data: DefaultResponse<unknown> =
            await this.generateCSVUseCase.executeResponse(userId);

        return response.status(data.status).json(data);
    }
}

export { GenerateCSVController };
