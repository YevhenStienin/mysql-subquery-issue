import * as express from "express";
import companyAPI from "../api/companies.api";

let router = express.Router();

router.post('/list', companyAPI.GetByFilter);

export default router;