import  { Request, Response, Router } from "express"
import { Readable } from "stream";
import readline from "readline";

function validatorCSV(req: Request, res: Response){
    if(req.file?.mimetype !== 'text/csv'){
        res.send({Erro:'Tipo de arquivo não suportado, utilize um arquivo CSV.'}).status(400)
    }
}

export default {
    async postArquivo(req: Request, res: Response) {
        validatorCSV(req, res)
        const arrayNames = []
        const b = req.file?.buffer
        
        const readableFile = new Readable()
        readableFile.push(b)
        readableFile.push(null)
    
        const nameLine = readline.createInterface({
            input: readableFile
        })
    
        for await(let line of nameLine) {
            const species_names = line.split(',')             //faz a leitura somente da primeira coluna do arquivo
            arrayNames.push(species_names[0])
        }
        
        return res.json(arrayNames);
    }
}
