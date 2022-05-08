class DefaultResponse<T> {
    readonly status: number;
    readonly data: T;

    constructor(status: number, data: T) {
        this.status = status;
        this.data = data;
    }
}

export { DefaultResponse };
