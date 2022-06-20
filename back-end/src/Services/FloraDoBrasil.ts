import axios from 'axios'
import https from 'https'

export class FloraDoBrasil {
  async buscaEspecieFloraDoBrasil(especies: Array<string>) {
    const data = []

    try {
      for (const especie of especies) {
        const dadosFloraDoBrasil = await axios.get(
          `https://servicos.jbrj.gov.br/flora/taxon/${especie}`,
          {
            httpsAgent: new https.Agent({
              rejectUnauthorized: false,
            }),
          },
        )
        data.push(dadosFloraDoBrasil.data)
      }

      return data
    } catch (err) {
      throw err
    }
  }
}
