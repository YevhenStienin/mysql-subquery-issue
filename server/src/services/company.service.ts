///<reference path="../../../typings/index.d.ts"/>

import * as mysql from "mysql";
import * as Q from "q";

import queryBuilder from "../providers/sql.query.builder";
import { Company } from "../models/company";
import { CompanyFilter } from "../models/filters";
import DBProvider from "../providers/db.provider";
import CompanyFactory from "../factories/company.factory";

export default class CompanyService {

    static GetByFilter(filter?: CompanyFilter): Q.Promise<Company[]> {
        let deferred = Q.defer<Company[]>();
        DBProvider.ConnectionPool.getConnection((error: NodeJS.ErrnoException, connection: mysql.PoolConnection) => {
            if (error) {
                deferred.reject(error);
            }
            else {
                // ----------------- It's not works -----------------------
                let query: string = "";
                try {
                    query = queryBuilder.GetQuery("companies", filter);
                } catch (error) {
                    deferred.reject(error);
                }
                // -------------------------------------------------------

                // -----------------But it's works perfect ----------------
                // If copy value from queryBuilder.GetQuery("companies", filter) and paste to the query.
                // let query: string = "SELECT * FROM `companies` WHERE Name LIKE '%Пиво%' AND Rate >= 3 AND Id IN (SELECT `CompanyId` FROM `companydishtypes` WHERE DishTypeId IN (1, 2, 3)) ORDER BY `Rate` DESC, `Name` ASC LIMIT 5";

                connection.query(query, function (error: mysql.QueryError, results: mysql.RowDataPacket[], fields: mysql.FieldPacket[]) {
                    connection.release();

                    if (error)
                        deferred.reject(error);
                    else
                        deferred.resolve(results.map(item => CompanyFactory.GetFullInfo(item)));
                });
            }
        });
        return deferred.promise;
    }
}