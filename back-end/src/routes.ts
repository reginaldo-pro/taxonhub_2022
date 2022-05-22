import  { response, Router } from "express"
import { FloraDoBrasil } from "./Parser/FloraDoBrasil";
import multer from 'multer'
import { Controller } from './Controllers/Controller'

const router = Router()


FloraDoBrasil.parseOutputFloraDoBrasil('Eichhornia azurea');


router.post('/users', (request, response) => {
    return response.status(201).send();
})
const upload = multer()

const controller = new Controller()

router.post('/busca-taxonomica', upload.single('filecsv'), controller.buscaFloraDoBrasil)

export { router }
