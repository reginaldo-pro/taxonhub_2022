import csvParser from 'csv-parser';
import fs from 'fs';
import { IRecord } from 'src/modules/model/WFORecord';

import { pathToDataFile } from '../../constants';
import { EMetaTableValues } from '../../enumerators/types';
import { WfoRepository } from '../../repositories/implementations/WfoRepository';

const headers = [
    'taxonID',
    'scientificNameID',
    'localID',
    'scientificName',
    'taxonRank',
    'parentNameUsageID',
    'scientificNameAuthorship',
    'family',
    'subfamily',
    'tribe',
    'subtribe',
    'genus',
    'subgenus',
    'specificEpithet',
    'infraspecificEpithet',
    'verbatimTaxonRank',
    'nomenclaturalStatus',
    'namePublishedIn',
    'taxonomicStatus',
    'acceptedNameUsageID',
    'originalNameUsageID',
    'nameAccordingToID',
    'taxonRemarks',
    'created',
    'modified',
    'references',
    'source',
    'majorGroup',
    'tplId',
];

class UpdateDatabaseUseCase {
    constructor(private wfoRepository: WfoRepository) {}

    private async updateDatabase(path: string): Promise<void> {
        await new Promise((resolve, reject) => {
            const readStream = fs.createReadStream(path);

            readStream
                .pipe(
                    csvParser({
                        separator: '\t',
                        skipLines: 1,
                        escape: '',
                        quote: '',
                        headers,
                    }),
                )
                .on('data', async (row) => {
                    try {
                        const data: IRecord = { ...row };

                        if (
                            data.taxonID === undefined ||
                            data.taxonID === null
                        ) {
                            return;
                        }

                        await this.wfoRepository.saveRecord(data);
                    } catch (err) {
                        reject(new Error('Some error occurred.'));
                    }
                })
                .on('end', () => {
                    resolve('');
                });
        });
    }

    private async setDatabaseStatusOnUpdate() {
        await this.wfoRepository.updateDatabaseConsistencyStatus(
            EMetaTableValues.inconsistent,
        );
        await this.wfoRepository.updateDatabasePhaseStatus(
            EMetaTableValues.unstable,
        );
    }

    async execute(newVersion: string) {
        await this.setDatabaseStatusOnUpdate();
        await this.wfoRepository.dropRecordTable();

        try {
            await this.updateDatabase(pathToDataFile);

            await this.wfoRepository.updateVersion(newVersion);
            await this.wfoRepository.updateDatabaseConsistencyStatus(
                EMetaTableValues.consistent,
            );
            await this.wfoRepository.updateDatabasePhaseStatus(
                EMetaTableValues.stable,
            );
        } catch {
            await this.wfoRepository.updateVersion(
                EMetaTableValues.errorOnUpdate,
            );

            await this.wfoRepository.updateDatabasePhaseStatus(
                EMetaTableValues.errorOnUpdate,
            );
        }
    }
}

export { UpdateDatabaseUseCase };
