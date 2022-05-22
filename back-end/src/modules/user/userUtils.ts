import { DefaultResponse } from 'src/modules/http/defaultResponse';
import { v4 as uuid } from 'uuid';

import { EHttpStatuses } from '../http/httpStatus';

function generateId(): DefaultResponse<unknown> {
    return new DefaultResponse<string>(EHttpStatuses.SUCCESS, uuid());
}

const userUtils = {
    generateId,
};

export { userUtils };
