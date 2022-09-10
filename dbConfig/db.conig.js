const mysql = require('mysql')

//Create Mysql Connection
const dbConn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'task_place_order'
})

dbConn.connect(function(err){
    if(err) throw console.log('Database not connected')
    console.log('Database Connected')
})

module.exports = dbConn