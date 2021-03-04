const express = require('express');
const app = express();
const mongoose =  require('mongoose');
const bodyParser = require('body-parser')
const cors = require('cors')
require('dotenv/config');

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });
  
// middlewares : a function that execute when routes are hit
app.use(cors())
app.use(bodyParser.json())

// Constants
const PORT = 5000;
const HOST = '0.0.0.0';
// import routes

const booksRoute = require('./routes/books')
app.use('/books', booksRoute)



// ROUTES
app.get('/', (req,res) => {
    res.send('This is a Restful API for books. Go to /books to get all books :)');

});



// connect to db
mongoose.connect(
    process.env.DB_CONNECTION, 
    { useNewUrlParser: true },
    () => console.log('connected to db!')
);

// listen to the server
app.listen(PORT, HOST); 