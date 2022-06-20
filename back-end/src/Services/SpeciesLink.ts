import axios from 'axios'

export class SpeciesLink {
  async buscaSpeciesLink(especies: Array<string>) {
    const dadosSpeciesLink = await axios.post(`https://api.splink.org.br/records`, {
      Scientificname: especies,
      Format: 'JSON',
    })

    return dadosSpeciesLink.data
  }
}
