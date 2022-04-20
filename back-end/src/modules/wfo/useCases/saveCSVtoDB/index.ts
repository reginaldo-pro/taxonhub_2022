import { PrismaClient } from '@prisma/client';

import { SaveCSVtoDBController } from './saveCSVtoDBController';
import { SaveCSVtoDBUseCase } from './saveCSVtoDBUseCase';

const prismaClient = new PrismaClient();
const saveCSVtoDBUseCase = new SaveCSVtoDBUseCase(prismaClient);
const saveCSVtoDBController = new SaveCSVtoDBController(saveCSVtoDBUseCase);

export { saveCSVtoDBController };
