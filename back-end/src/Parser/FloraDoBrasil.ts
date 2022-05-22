const test = require('./output.json');

enum Database {
  FDB = 'FDB',
  TPL = 'TPL',
}

interface LineOutputTaxon {
  id: number,
  searchedSpeciesName: String,
  returnedNames: String,
  synonymOf: String,
  database: Database,
  respectiveFamily: String,
  autor: String,
}


export class FloraDoBrasil {
  static parseOutputFloraDoBrasil(searchedSpeciesName: String): LineOutputTaxon[] {
    var lines: LineOutputTaxon[] = [];

    for (const line of test.result) {
      let taxon: LineOutputTaxon

      if(line.taxonomicstatus == 'NOME_ACEITO') {
        taxon = {
          id: +line.taxonid,
          searchedSpeciesName: searchedSpeciesName,
          returnedNames: line.scientificname,
          synonymOf: '',
          database: Database.FDB,
          respectiveFamily: line.family,
          autor: line.scientificnameauthorship,
        }
        
        if (!lines.find(line => line.id == taxon.id)) {
          lines.push(taxon);
        }

        for (const synonym of line['SINONIMO']) {
          taxon = {
            id: +synonym.taxonid,
            searchedSpeciesName: 'Eichhornia azurea',
            returnedNames: synonym.scientificname,
            synonymOf: line.scientificname,
            database: Database.FDB,
            respectiveFamily: synonym.family,
            autor: synonym.scientificnameauthorship,
          }

          if (!lines.find(line => line.id == taxon.id)) {
            lines.push(taxon);
          }
        }
      } else if (line.taxonomicstatus == 'SINONIMO') {
        taxon = {
          id: +line.taxonid,
          searchedSpeciesName: searchedSpeciesName,
          returnedNames: line.scientificname,
          synonymOf: line['NOME ACEITO'][0].scientificname,
          database: Database.FDB,
          respectiveFamily: line.family,
          autor: line.scientificnameauthorship,
        }
        
        if (!lines.find(line => line.id == taxon.id)) {
          lines.push(taxon);
        }

        for (const accepted of line['NOME ACEITO']) {
          taxon = {
            id: +accepted.taxonid,
            searchedSpeciesName: 'Eichhornia azurea',
            returnedNames: accepted.scientificname,
            synonymOf: '',
            database: Database.FDB,
            respectiveFamily: accepted.family,
            autor: accepted.scientificnameauthorship,
          }

          if (!lines.find(line => line.id == taxon.id)) {
            lines.push(taxon);
          }
        }
      }
    }

    return lines;
  }
}