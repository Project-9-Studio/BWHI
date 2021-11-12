'use strict';
const express = require('express');
const serverless = require('serverless-http');
const swaggerUi = require('swagger-ui-express');
const swaggerJSDoc = require('swagger-jsdoc');
const apiRouter = require('./routes');

const app = express();
const appRouter = express.Router();

// parse application/json
app.use(express.json());

// Swagger UI
const swaggerSpec = swaggerJSDoc(require('./swaggerSpec'));
appRouter.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// API
appRouter.use('/', apiRouter);

app.use(`/.netlify/functions/api`, appRouter);

module.exports.handler = serverless(app);
