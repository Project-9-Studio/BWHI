'use strict';
const express = require('express');
const serverless = require('serverless-http');
const app = express();

// parse application/json
app.use(express.json());

app.get('/', function (req, res) {
    res.send('hello world')
});

module.exports.handler = serverless(app);
