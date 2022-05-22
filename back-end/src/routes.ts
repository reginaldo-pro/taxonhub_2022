import { Router } from 'express'
import multer from 'multer'
import { Controller } from './Controllers/Controller'

const router = Router()

const upload = multer()

const controller = new Controller()

router.post('/busca-taxonomica', upload.single('filecsv'), controller.buscaFloraDoBrasil)

export { router }
