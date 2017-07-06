import * as express from "express";
var bodyParser = require('body-parser');

// Services
import SettingsProvider from "./providers/settings.provider";
import DBProvider from "./providers/db.provider";

// Custom Middlewares
import ErrorHandler from "./middleware/error.handler";

// routers
import CompaniesRoutes from "./routes/companies.routes";

export class WebApi {
    /**
     * @param app - express application
     * @param port - port to listen on
     */
    constructor(private app: express.Express, private port: number) {
        // Configure services
        this.configureServices();

        // Configure server
        this.configureMiddleware(app);
        this.configureRoutes(app);
    }

    private configureServices() {
        // Get settings
        SettingsProvider.Initialize("settings.json");
        let settings = SettingsProvider.Settings;
        // Initialize database connection pool
        DBProvider.Initialize(settings.DBConnection);
    }

    private configureMiddleware(app: express.Express) {
        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({ extended: false }));
    }

    private configureRoutes(app: express.Express) {
        app.use("/api/companies", CompaniesRoutes);
        app.use(ErrorHandler);
    }

    public run() {
        this.app.listen(this.port);
    }
}