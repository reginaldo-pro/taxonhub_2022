import { Request, Response } from 'express'
import { FloraDoBrasil } from '../Services/FloraDoBrasil'

export class Controller {
  async buscaFloraDoBrasil(req: Request, res: Response) {
    const { especie } = req.params
    const floraDoBrasil = new FloraDoBrasil()

    try {
      const dados = await floraDoBrasil.buscaEspecieFloraDoBrasil(['Eichhornia azurea'])
      res.json(dados).status(200)
    } catch (err) {
      res.json({ erro: 'Erro inesperado' }).status(400)
    }
    return
  }
}
