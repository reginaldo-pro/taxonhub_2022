import { Request, Response } from 'express';

import { GetTaxonomyByNameUseCase } from './getTaxonomyByNameUseCase';

class GetTaxonomyByNameController {
    constructor(private getTaxonomyByNameUseCase: GetTaxonomyByNameUseCase) {}

    async handle(request: Request, response: Response) {
        try {
            const { name } = request.body;

            const data = await this.getTaxonomyByNameUseCase.execute(name);

            return response.status(200).json(data);
        } catch (error) {
            return response.status(500).json({ error: error.message });
        }
    }
}

export { GetTaxonomyByNameController };
