import  { Request, Response, Router } from "express"

const router =  Router()

import { Readable } from "stream";
import multer from 'multer';
import csv from "fast-csv";
import readline from "readline";
import fs from "fs";

const upload = multer();

router.post('/users', (request, response) => {
    return response.status(201).send();
})

router.post('/img', upload.single("filecsv"), async (req: Request, res: Response) => {
    const arrayNames = []
    const b = req.file?.buffer
    
    const readableFile = new Readable()
    readableFile.push(b)
    readableFile.push(null)

    const nameLine = readline.createInterface({
        input: readableFile
    })

    for await(let line of nameLine) {
        arrayNames.push(line)
    }

    return res.json(arrayNames);
})

export { router } 
 