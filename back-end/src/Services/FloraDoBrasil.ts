import axios from 'axios'

export class FloraDoBrasil {
  async buscaEspecieFloraDoBrasil(especies: Array<string>) {
    // const especies = ['Eichhornia azurea']
    const data = []

    try {
      for (const especie of especies) {
        console.log('searching ', `https://servicos.jbrj.gov.br/flora/taxon/${especie}`)

        const dadosFloraDoBrasil = await axios.get(
          `https://servicos.jbrj.gov.br/flora/taxon/${especie}`,
        )
        data.push(dadosFloraDoBrasil.data)
      }

      return data
    } catch (err) {
      console.log(err)
      throw err
    }
  }
}
