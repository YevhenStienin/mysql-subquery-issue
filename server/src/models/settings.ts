export class Settings {
    constructor(public DBConnection: DBConnection) { }
}

export class DBConnection {
    constructor(public PoolSize: number,
        public Host: string,
        public Port: number,
        public Database: string,
        public User: string,
        public Password: string) { }
}