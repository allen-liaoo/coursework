const mysql = require("mysql")
const conn = mysql.createPool({
    host:"cse-mysql-classes-01.cse.umn.edu",
    // port:"3306",
    username:"C4131F22U64",
    password:"4131db",
    database:"C4131F22U64",
    connectionLimit:5
});

async function getColors() {
    return new Promise((resolve, reject) => {
        conn.query("select * from colors", (err, rows) => {
            if (err) {
                console.log("ERROR: "+err);
            }
            else resolve(rows);
        })
    });
}
  
exports.getColors = getColors
async function addColor(name, code) {
    return new Promise((resolve, reject) => {
        conn.query("insert into colors values (?, ?)", [name, code], (err, rows) => {
            if (err) {
                console.log("ERROR: "+err);
            }
            else resolve(rows);
        })
    });
}
exports.addColor = addColor

// // This is an entirely fake version of this database file.
// // Your job will be to rewrite this file to use an actual database.
// // You'll know you've done it when you can restart the server and still use it!

// const colors = [
//   {name: "red", color_code:"#ff0000"},
//   {name: "green", color_code:"#00ff00"},
//   {name: "olive", color_code:"#808000"}
// ]
// async function getColors() {
//   return colors
// }

// exports.getColors = getColors
// async function addColor(name, code) {
//   colors.push({name:name, color_code:code})
// }
// exports.addColor = addColor