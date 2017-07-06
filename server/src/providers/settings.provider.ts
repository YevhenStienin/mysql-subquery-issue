import { DBConnection, Settings } from "../models/settings";
import * as path from 'path';
var appRoot = require('app-root-path');

export default class SettingsProvider {
    private static settings: Settings;

    public static Initialize(configName: string): void {
        var settings = require(path.join(appRoot.path, "server/settings/", configName));
        SettingsProvider.settings = new Settings(settings.DBConnection);
    }

    public static get Settings(): Settings {
        return SettingsProvider.settings;
    }

}