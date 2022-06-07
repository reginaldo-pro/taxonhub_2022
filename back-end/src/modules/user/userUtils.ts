import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { v4 as uuid } from 'uuid';

import { EHttpStatuses } from '../http/httpStatus';

interface IUserDetails {
    userID: string;
}

function generateId(): DefaultResponse<IUserDetails> {
    return new DefaultResponse<IUserDetails>(EHttpStatuses.SUCCESS, {
        userID: uuid(),
    });
}

const userUtils = {
    generateId,
};

export { userUtils, IUserDetails };
