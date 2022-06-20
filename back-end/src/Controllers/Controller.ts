import { Request, Response } from 'express'
import { FloraDoBrasil } from '../Services/FloraDoBrasil'
import { ParserCSV } from '../Services/MulterParser'
import { OutputParser } from '../Services/OutputParser'
import { SpeciesLink } from '../Services/SpeciesLink'
import { Formatters } from '../Utils/Formatters'

export class Controller {
  async buscaFloraDoBrasil(req: Request, res: Response) {
    const parserCSV = new ParserCSV()
    const floraDoBrasil = new FloraDoBrasil()
    const outputParser = new OutputParser()
    const formatters = new Formatters()

    try {
      const especies = await parserCSV.parserCSVtoJSON(req, res)
      const dados = await floraDoBrasil.buscaEspecieFloraDoBrasil(especies)

      const jsonSplited = formatters.splitJson(dados.toString())
      const jsonFormatted = formatters.addNameSearchedToJson(jsonSplited, especies)

      const data = outputParser.parseOutputFloraDoBrasil(jsonFormatted)

      return res.status(200).send({ dados: jsonFormatted })
    } catch (err) {
      return res.status(400).send({ erro: 'Erro inesperado' })
    }
  }

  async buscaSpeciesLink(req: Request, res: Response) {
    const parserCSV = new ParserCSV()
    const speciesLink = new SpeciesLink()

    try {
      const especies = await parserCSV.parserCSVtoJSON(req, res)
      const dados = await speciesLink.buscaSpeciesLink(especies)
      res.status(200).send(dados)
    } catch (err) {
      res.status(400).send({ erro: 'Erro inesperado' })
    }
    return
  }
}
