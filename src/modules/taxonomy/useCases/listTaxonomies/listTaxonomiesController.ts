import { Request, Response } from "express";
import { ListTaxonomiesUseCase } from "./listTaxonomiesUseCase";

class ListTaxonomiesController {

    constructor(private listTaxonomiesUseCase: ListTaxonomiesUseCase) { }
    handle(request: Request, response: Response): Response {

        const taxonomies = this.listTaxonomiesUseCase.execute(); //faz a busca
        console.log(taxonomies)
        return response.status(201).json(taxonomies) 
    }

}


export { ListTaxonomiesController }