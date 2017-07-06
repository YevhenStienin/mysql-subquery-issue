///<reference path="../../../typings/index.d.ts"/>

import * as mysql from "mysql";
import { DBConnection, Settings } from '../models/settings';

export default class DBProvider {
    private static pool: mysql.Pool;

    public static Initialize(settings: DBConnection): void {
        DBProvider.pool = mysql.createPool({
            connectionLimit: settings.PoolSize,
            host: settings.Host,
            port: settings.Port,
            user: settings.User,
            password: settings.Password,
            database: settings.Database,
            multipleStatements: true,
            debug: true,
            trace: false
        });
    }

    public static get ConnectionPool(): mysql.Pool {
        return DBProvider.pool;
    }

}