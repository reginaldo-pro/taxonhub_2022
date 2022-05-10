import  { Request, Response, Router } from "express"
import { Readable } from "stream";
import readline from "readline";

export default {
    
    async postArquivo(req: Request, res: Response) {
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
    }
}
