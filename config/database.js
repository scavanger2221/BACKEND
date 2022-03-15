import { Sequelize } from "sequelize";

const db = new Sequelize('besthost_balibesthostels', 'besthost_balibesthostels', 'TTdC7P#7V^AZ', {
    host : 'localhost',
    dialect : 'mysql'
});

export default db;