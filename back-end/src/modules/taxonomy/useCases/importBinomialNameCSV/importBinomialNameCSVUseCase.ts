import csvParser from 'csv-parser';
import fs from 'fs';
import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { EHttpStatuses } from 'src/modules/http/httpStatus';

interface IBinomialName {
    binomialName: string;
}

class ImportBinomialNameCSVUseCase {
    async execute(
        file: Express.Multer.File,
    ): Promise<DefaultResponse<unknown>> {
        const stream = fs.createReadStream(file.path);

        const incorrectNames = [];

        try {
            await new Promise((resolve, reject) => {
                stream
                    .pipe(csvParser())
                    .on('data', async (row) => {
                        const name: IBinomialName = row;

                        if (!this.parseLine(name)) {
                            incorrectNames.push(name.binomialName);
                        }
                    })
                    .on('error', () => {
                        reject(new Error('error'));
                    })
                    .on('end', () => {
                        resolve('');
                    });
            });
        } catch {
            return new DefaultResponse<unknown>(
                EHttpStatuses.INTERNAL_SERVER_ERROR,
                {
                    correct: incorrectNames.length === 0,
                    incorrectNames,
                },
            );
        }

        return new DefaultResponse<unknown>(EHttpStatuses.SUCCESS, {
            correct: incorrectNames.length === 0,
            incorrectNames,
        });
    }

    private parseLine(line: IBinomialName): boolean {
        const count = (line.binomialName.match(/ /g) || []).length;

        return count === 1;
    }
}

export { ImportBinomialNameCSVUseCase };
