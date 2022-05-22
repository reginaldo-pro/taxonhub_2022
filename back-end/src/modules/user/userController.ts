import { Request, Response } from 'express';
import { DefaultResponse } from 'src/modules/http/defaultResponse';

import { userUtils } from './userUtils';

class UserController {
    handle(_request: Request, response: Response) {
        const data: DefaultResponse<unknown> = userUtils.generateId();

        return response.status(data.status).json(data);
    }
}

const userController = new UserController();

export { userController };
