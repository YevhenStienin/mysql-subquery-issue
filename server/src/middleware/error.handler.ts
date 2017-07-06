import * as express from "express";

let RequestLogger: express.ErrorRequestHandler = (
    error: any,
    request: express.Request,
    response: express.Response,
    next: express.NextFunction
) => {
    response.status(500).json(error.message || error);
}

export default RequestLogger;