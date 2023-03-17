const mysql = require("mysql");
const table = "contactMsg";
const conn = mysql.createConnection({
    host: "cse-mysql-classes-01.cse.umn.edu",
    database: "C4131F22U64",
    user: "C4131F22U64",
    password: "4131db",
    connectionLimit: 5
});

function sendMessage(input) {
    return new Promise((resolve, reject) => {
        conn.query(`insert into ${table} values (?, ?, ?, ?, ?, ?)`, 
        [input.title, input.email, input.username, input.link, input.category, input.message],
        (err, rows) => {
            if (err) reject(err);
            else resolve(rows);
        })
    })
}

exports.sendMessage = sendMessage;

function getContactLog(input) {
    return new Promise((resolve, reject) => {
        let cond = "";
        if (input && input != "all") {
            cond = "where category= ?";
        }
        conn.query(`select * from ${table} `+ cond,
        [input],
        (err, rows) => {
            if (err) reject(err.sqlMessage || err.code);
            else if (rows.length == 0) reject("No messages found")
            else resolve(rows);
        })
    })
}

exports.getContactLog = getContactLog;