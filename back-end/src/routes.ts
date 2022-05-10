import  { response, Router } from "express"
import multer from 'multer';
import ParserController from "./parser";

const router =  Router()

const upload = multer();

router.post('/users', (request, response) => {
    return response.status(201).send();
})

router.post('/img', upload.single("filecsv"), ParserController.postArquivo)

export { router } 
 