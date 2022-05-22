import { Router } from 'express';
import { userController } from 'src/modules/user/userController';

const userRoutes = Router();

userRoutes.get('/newid', (req, res) => {
    return userController.handle(req, res);
});

export { userRoutes };
