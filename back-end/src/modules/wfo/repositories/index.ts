import { dbClient } from 'src/modules/database/client';

import { WfoRepository } from './implementations/WfoRepository';

const wfoRepository = new WfoRepository(dbClient);

export { wfoRepository };
