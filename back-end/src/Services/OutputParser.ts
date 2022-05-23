enum Database {
  FDB = 'FDB',
  TPL = 'TPL',
}

interface LineTaxon {
  id: number | null,
  searchedSpeciesName: string,
  returnedNames: string,
  synonymOf: string,
  database: Database,
  respectiveFamily: string,
  autor: string,
  found: boolean,
}

export class OutputParser {
  parseOutputFloraDoBrasil(data: any): LineTaxon[] {
    var lines: LineTaxon[] = [];

    for (var i = 0; i < data.result.length; i++) {
      let taxon: LineTaxon;

      const item = data.result[i];


      if (item.result == null) {
        taxon = {
          id: null,
          searchedSpeciesName: item['Name Searched'],
          returnedNames: '',
          synonymOf: '',
          database: Database.FDB,
          respectiveFamily: '',
          autor: '',
          found: false,
        }

        lines.push(taxon)
      } else {
        for (const line of item.result) {
          if(line.taxonomicstatus == 'NOME_ACEITO') {
            taxon = {
              id: +line.taxonid,
              searchedSpeciesName: item['Name Searched'],
              returnedNames: line.scientificname,
              synonymOf: '',
              database: Database.FDB,
              respectiveFamily: line.family,
              autor: line.scientificnameauthorship,
              found: true,
            }
            
            if (!lines.find(line => line.id == taxon.id)) {
              lines.push(taxon);
            }
    
            for (const synonym of line['SINONIMO']) {
              taxon = {
                id: +synonym.taxonid,
                searchedSpeciesName: item['Name Searched'],
                returnedNames: synonym.scientificname,
                synonymOf: line.scientificname,
                database: Database.FDB,
                respectiveFamily: synonym.family,
                autor: synonym.scientificnameauthorship,
                found: true,
              }
    
              if (!lines.find(line => line.id == taxon.id)) {
                lines.push(taxon);
              }
            }
          } else if (line.taxonomicstatus == 'SINONIMO') {
            taxon = {
              id: +line.taxonid,
              searchedSpeciesName: item['Name Searched'],
              returnedNames: line.scientificname,
              synonymOf: line['NOME ACEITO'][0].scientificname,
              database: Database.FDB,
              respectiveFamily: line.family,
              autor: line.scientificnameauthorship,
              found: true,
            }
            
            if (!lines.find(line => line.id == taxon.id)) {
              lines.push(taxon);
            }
    
            for (const accepted of line['NOME ACEITO']) {
              taxon = {
                id: +accepted.taxonid,
                searchedSpeciesName: item['Name Searched'],
                returnedNames: accepted.scientificname,
                synonymOf: '',
                database: Database.FDB,
                respectiveFamily: accepted.family,
                autor: accepted.scientificnameauthorship,
                found: true,
              }
    
              if (!lines.find(line => line.id == taxon.id)) {
                lines.push(taxon);
              }
            }
          }
        }
      }
    }

    return lines;
  }
}