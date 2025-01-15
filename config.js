require('dotenv').config()

module.exports = {
    mysql_database: {
        host: process.env.MYSQL_HOST,
        db: process.env.MYSQL_DB,
        user: process.env.MYSQL_USER,
        pass: process.env.MYSQL_PASS,
    },
}