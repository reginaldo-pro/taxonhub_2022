import { v4 as uuidv4 } from 'uuid';

class Ocurrency {
    // model

    id?: string;
    name: string;
    // adicionar restante

    constructor() {
        if (!this.id) {
            this.id = uuidv4();
        }
    }
}

export { Ocurrency };
