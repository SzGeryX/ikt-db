const express = require('express')
const app = express()
const cors = require('cors')
const port = 3000

const mysql = require('mysql');


const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'mystery'
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.use(cors());

app.get('/suspects', (req, res) => {
    responseObj = []
    con.query('SELECT * FROM suspect', (err, rows, fields) => {
        if (err) throw err

        res.json(rows)
    })
})

app.get('/detectives', (req, res) => {
    responseObj = []
    con.query('SELECT * FROM detective', (err, rows, fields) => {
        if (err) throw err

        res.json(rows)
    })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})