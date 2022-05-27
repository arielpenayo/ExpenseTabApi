var express = require('express');
var bodyParser = require('body-parser')
var cors = require('cors');
var morgan = require('morgan');
var methodOverride = require('method-override');
var compression = require('compression');
var fs = require('fs');
var routes = require('./routes');
var app = express();
var server = app.listen();
const cron = require('node-cron');
var mailer = require('./mailer/mailer');

server.setTimeout(500000);


// parse application/x-www-form-urlencoded
app.use(express.urlencoded({limit: '50mb'}));
// parse application/json
app.use(express.json({limit: '50mb'}));
// compress all responses
app.use(compression());
// Lets you use HTTP verbs such as PUT or DELETE in places where the client doesn’t support it.
app.use(methodOverride());
// HTTP request logger middleware for node.js
app.use(morgan('dev'));
// enable all CORS requests
app.use(cors());
// App models
fs
  .readdirSync(__dirname + "/models")
  .filter(file => {
    return (file.indexOf('.') !== 0) && (file.slice(-3) === '.js' && file !== 'index.js');
  })
  
  
// App Routes
app.use(routes(express.Router()));
// Static files 
app.use(express.static(__dirname + '/'));
// Models of the server
var models = require('./models/');

models.sequelize
    .authenticate()
    .then(function() {
        console.log('Connection successful');
    })
    .catch(function(error) {
        console.log('Error creating connection');
    });
// Config zone
process.env.TZ = "GMT-4";
// Listen server
app.set("port", 3456);
app.listen(app.get("port"), function () {
  console.log(`API Server listen on ${3456}`);
});


cron.schedule(' * * * * * ',() => {
  mailer.enviarCorreo()
  .then((result) => {
    console.log("result",result)
  })
  .catch((err) => {
    console.log('err :>> ', err);        
  });
});