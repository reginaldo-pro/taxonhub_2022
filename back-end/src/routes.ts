import  { response, Router } from "express"
import { FloraDoBrasil } from "./Parser/FloraDoBrasil";

const router =  Router()


FloraDoBrasil.parseOutputFloraDoBrasil('Eichhornia azurea');


router.post('/users', (request, response) => {
    return response.status(201).send();
})

export { router } 
 