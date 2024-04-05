const { createConnection } = require("mysql");
require("dotenv").config();
const port = process.env.PORT || 3000;
const pool = createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_Name,
  // connectionLimit: 10,
});
pool.connect((err) => {
  if (err) {
    console.log("Connected to Error: ", err);
  }
  console.log("Connected to the database!");
});
// pool.query(`SELECT * FROM customer_data_new_1`, (err, results) => {
//   if (err) {
//     return console.log(err);
//   }
//   return console.log(results);
// });
module.exports = pool;
