import { Request, Response } from 'express'
import { FloraDoBrasil } from '../Services/FloraDoBrasil'
import { ParserCSV } from '../Services/MulterParser'

export class Controller {
  async buscaFloraDoBrasil(req: Request, res: Response) {
    const parserCSV = new ParserCSV()
    const floraDoBrasil = new FloraDoBrasil()

    const especies = await parserCSV.parserCSVtoJSON(req, res)

    try {
      const dados = await floraDoBrasil.buscaEspecieFloraDoBrasil(especies)
      res.send({ dados: dados }).status(200)
    } catch (err) {
      res.send({ erro: 'Erro inesperado' }).status(400)
    }
    return
  }
}
