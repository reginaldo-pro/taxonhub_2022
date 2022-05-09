import  { response, Router } from "express"

const router =  Router()

import { Readable } from "stream";
import multer from 'multer';
import csv from "fast-csv";
import readline from "readline";

const upload = multer();

router.post('/users', (request, response) => {
    return response.status(201).send();
})

router.post('/img', upload.single("filecsv"), async (request, response) => {
    const buffer = request.file?.buffer;
    // console.log(buffer)
    const readableFile = new Readable();
    readableFile.push(buffer);

    // ####ERROR AO USAR READABLEFILE

    console.log(readableFile)

    // const speciesLine = readline.createInterface({
    //     input: readableFile
    // });

    // for await (let line of speciesLine) {
    //     console.log(line)
    // }

    return response.json("Testando");
})

export { router } 
 