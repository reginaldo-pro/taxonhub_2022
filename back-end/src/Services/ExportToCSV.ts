import * as csv from "fast-csv";
import fs from "fs";
const ws = fs.createWriteStream("data.csv");

export class ExportToCSV {
  exportFile(especies: Object) {
    console.log("EXPORT FILE CSV")
    const list = Object.entries(especies)
    console.log(typeof(list))
    
    list.map((v) => {
      console.log(v)
    })
    // console.log(list.map)
    // const jsonData = list


    // csv
    //   .write(jsonData, {headers: true})
    //   .on("finish", function() {
    //     console.log("Arquivo CSV criado com sucesso!")
    //   })
    //   .pipe(ws)
  }
}
