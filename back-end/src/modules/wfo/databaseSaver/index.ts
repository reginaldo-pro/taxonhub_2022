import { PrismaClient } from '@prisma/client';
import csvParser from 'csv-parser';
import fs from 'fs';

import { headers } from './constants';
import { IRecord } from './types';

const prisma = new PrismaClient();

fs.createReadStream('classification.txt')
    .pipe(
        csvParser({
            separator: '\t',
            skipLines: 1,
            escape: '',
            quote: '',
            headers,
        })
    )
    .on('data', async (row) => {
        const data: IRecord = { ...row };

        await prisma.record.create({
            data: { ...data },
        });
    })
    .on('end', () => {
        console.log('finished.');
    });
