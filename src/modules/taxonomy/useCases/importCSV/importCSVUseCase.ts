import fs from 'fs';
import {parse} from 'csv-parse';
import { ITaxonomyRepository } from '../../repositories/ITaxonomyRepository';


interface IImportCSV {
    //dados arquivo csv
    name: string;
}
class ImportCSVUseCase {
    constructor(private taxonomiesRepository: ITaxonomyRepository){}


    async execute(file: Express.Multer.File): Promise<IImportCSV[]> {
        return new Promise((resolve, reject) => {
            const stream = fs.createReadStream(file.path);
            
            const taxonomies: IImportCSV[] = []
            const parseFile = parse()
    
            stream.pipe(parseFile);
            parseFile.on('data', async (line) => {
                const [name] = line;
                taxonomies.push({
                    name,
                })
            })
            .on('end', () => {
                fs.promises.unlink(file.path);
                resolve(taxonomies);
            })
            .on('error', (err) => {
                reject(err);
            })
        })
    
    }

}


export { ImportCSVUseCase }