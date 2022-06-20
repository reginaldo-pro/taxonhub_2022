import { Request, Response } from 'express'
import readline from 'readline'
import { Readable } from 'stream'

function validatorCSV(req: Request, res: Response) {
  if (req.file?.mimetype !== 'text/csv') {
    res.status(400).send({ Erro: 'Tipo de arquivo não suportado, utilize um arquivo CSV.' })
    return false
  }
  return true
}

export class ParserCSV {
  async parserCSVtoJSON(req: Request, res: Response): Promise<Array<string>> {
    if (!validatorCSV(req, res)) return []

    const arrayNames = []
    const b = req.file?.buffer

    const readableFile = new Readable()
    readableFile.push(b)
    readableFile.push(null)

    const nameLine = readline.createInterface({
      input: readableFile,
    })

    for await (let line of nameLine) {
      const species_names = line.split(',') //faz a leitura somente da primeira coluna do arquivo
      arrayNames.push(species_names[0])
    }

    return arrayNames
  }
}
