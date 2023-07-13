const sql = require('mysql2');
require('dotenv').config();

const connection = sql.createConnection({
  host: 'localhost',
  user: "noor",
  password: "noor.20103048",
  // user: process.env.DB_USER,
  // password: process.env.DB_PASS,
  database: 'mydb',
  multipleStatements: true});

  
// console.log(process.env.DB_USER)
  exports.connect = (done) => {
      connection.connect((err) =>{
          if(err){
              console.log('db connection error');
          }
          else{
              done()
          }
     })
  }
  
  exports.connection = connection;

// module.exports = connection;