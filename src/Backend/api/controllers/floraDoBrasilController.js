const axios = require("axios");
const papa = require("papaparse");
module.exports = () => {
  const controller = {};

  controller.buscarDados = async (req, res) => {
    let resultados = [];
    console.log(req.body)
    if (req.body !== undefined && req.body.names !== undefined && req.body.names.length > 0) {
      for (const nomeEspecie of req.body.names) {
        if (!isBlank(nomeEspecie)) {
          let dados = await buscarEspecies(nomeEspecie);
          const dadosFormatados = formatarDados(dados, nomeEspecie);
          resultados = resultados.concat(dadosFormatados);
        }
      }
    }
    res.send(resultados);
  };

  const buscarEspecies = async (nomeEspecie) => {
    return axios
      .get("https://servicos.jbrj.gov.br/flora/#!/CheckList/get_taxon_scientificname", {
        params: {
          q: nomeEspecie
        },
        timeout: 10000,
      })
      .then((response) => {
        return response.data;
      })
      .catch((error) => {
        if (error.response) {
          throw new Error(`Erro na resposta: ${error.response.status}`);
        } else if (error.request) {
          throw new Error(`Erro na requisição: ${error.request}`);
        } else {
          throw new Error(
            `Erro nas configurações da requisição: ${error.message}`
          );
        }
      });
  };

  const formatarDados = (dados, nomeEspecie) => {
    try {
      const parse = papa.parse(dados, {
        header: true,
        dynamicTyping: true,
        skipEmptyLines: true,
      });
      if (Object.keys(parse.errors).length !== 0) {
        throw new Error("CSV Incorreto");
      }

      return CriarObjetoRetorno(parse, nomeEspecie);
    } catch (error) {
      throw new Error(`Erro formatação dos dados: ${error.message}`);
    }

    function CriarObjetoRetorno(parse, nomeEspecie) {
      let nomeAceito = "";
      return parse.data.map((row) => {
        let nome =
          row["Genus"] + " " + row["Species"] + " " + row["Authorship"];
        if (row["Taxonomic status in FDB"] === "Accepted") nomeAceito = nome;

        return {
          nomePesquisado: nomeEspecie,
          nomeRetornado: nome,

          aceitoSinonimo: row["Taxonomic status in FDB"] === "Accepted"? "nome_aceito": "sinonimo",
          sinonimoDe: nomeAceito === nome ? "" : nomeAceito,
          baseDados: "FDB",
          familia: row["Family"],
        };
      });
    }
  };
  const isBlank = (str) => {
    return !str || /^\s*$/.test(str);
  };
  return controller;
};
