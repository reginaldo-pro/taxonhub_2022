import { Request, Response } from 'express'
import { FloraDoBrasil } from '../Services/FloraDoBrasil'
import { ParserCSV } from '../Services/MulterParser'
import { OutputParser } from '../Services/OutputParser'
import { Formatters } from '../Utils/Formatters'

export class Controller {
  async buscaFloraDoBrasil(req: Request, res: Response) {
    const parserCSV = new ParserCSV()
    const floraDoBrasil = new FloraDoBrasil()
    const outputParser = new OutputParser()
    const formatters = new Formatters()

    const especies = await parserCSV.parserCSVtoJSON(req, res)

    try {
      const dados = await floraDoBrasil.buscaEspecieFloraDoBrasil(especies)

      const jsonSplited = formatters.splitJson(dados.toString())
      const jsonFormatted = formatters.addNameSearchedToJson(jsonSplited, especies)

      const data = outputParser.parseOutputFloraDoBrasil(jsonFormatted)
      console.log(data);

      res.send({ dados: jsonFormatted }).status(200)
    } catch (err) {
      res.send({ erro: 'Erro inesperado' }).status(400)
    }
    return
  }
}
