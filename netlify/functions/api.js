'use strict';
const express = require('express');
const serverless = require('serverless-http');
const app = express();

// parse application/json
app.use(express.json());

module.exports.handler = serverless(app);
