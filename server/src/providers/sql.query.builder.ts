import * as mysql from "mysql";
import { CompanyFilter, SortDirection, Sorting } from "../models/filters";

export default class SQLQueryBuilder {

    static GetQuery(tableName: string, filter?: CompanyFilter): string {
        let sql: string = mysql.format('SELECT * FROM ??', [tableName]);

        if (!filter) {
            return sql;
        }
        else {
            let conditions: string[] = SQLQueryBuilder.GetConditionsByFilter(filter);
            if (conditions.length) {
                // Create SQL Query with WHERE conditions
                sql += ` WHERE ${conditions.join(" AND ")}`;
            }

            // Add sorting
            if (filter.Sorting) {
                let sortParts: string[] = filter.Sorting.map((order: Sorting) => {
                    return mysql.format(`?? ${order.Direction.toString()}`, [order.Field]);
                });
                sql += ` ORDER BY ${sortParts.join(", ")}`;
            }

            // Add skip and amount limits
            if (filter.Amount && filter.Amount > 0) {
                sql += filter.Skip && filter.Skip > 0 ?
                    mysql.format(` LIMIT ?,?`, [filter.Skip, filter.Amount]) :
                    mysql.format(` LIMIT ?`, [filter.Amount]);
            }

            return sql;
        }
    }

    private static GetConditionsByFilter(filter: CompanyFilter): string[] {

        let conditions: string[] = [];

        if (filter.Name) {
            conditions.push(mysql.format("Name LIKE ?", [`%${filter.Name}%`.toString()]));
        }

        if (filter.MinRate) {
            conditions.push(mysql.format("Rate >= ?", [filter.MinRate]));
        }
        if (filter.DishTypeIds && filter.DishTypeIds.length) {
            conditions.push(mysql.format("Id IN (SELECT `CompanyId` FROM `companydishtypes` WHERE DishTypeId IN (?))", [filter.DishTypeIds]));
        }

        return conditions;
    }

}