import * as express from "express";

import CompanyService from "../services/company.service";
import FilterFactory from "../factories/filter.factory";

// Get List of Companies by filter
let GetByFilter: express.RequestHandler = (
    request: express.Request,
    response: express.Response,
    next: express.NextFunction
) => {
    let filter = FilterFactory.GetCompanyFilter(request.body);

    CompanyService.GetByFilter(filter)
        .then(companies => {
            response.status(200).json(companies);
        })
        .catch((error) => {
            next(error);
        });
}

export default {
    GetByFilter: GetByFilter
};