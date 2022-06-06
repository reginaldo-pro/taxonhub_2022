import { Request, Response } from 'express';
import { DefaultResponse } from 'src/modules/http/defaultResponse';

import { IUserDetails, userUtils } from './userUtils';

class UserController {
    handle(_request: Request, response: Response): Response {
        const data: DefaultResponse<IUserDetails> = userUtils.generateId();

        return response.status(data.status).json(data);
    }
}

const userController = new UserController();

export { userController };
