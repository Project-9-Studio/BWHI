'use strict';
const express = require('express');
const serverless = require('serverless-http');
const swaggerUi = require('swagger-ui-express');
const swaggerJSDoc = require('swagger-jsdoc');
const { auth } = require('express-openid-connect');
const apiRouter = require('./routes');

const app = express();
const appRouter = express.Router();

// parse application/json
app.use(express.json());

const config = {
    authRequired: false,
    auth0Logout: true,
    secret: 'a long, randomly-generated string stored in env',
    baseURL: 'http://localhost:8000',
    clientID: '2PfiGgm0gXe361DQlga7lDZX9OrCSvmW',
    issuerBaseURL: 'https://dev-qtbcszl1.us.auth0.com'
};

// auth router attaches /login, /logout, and /callback routes to the baseURL
appRouter.use(auth(config));

// Swagger UI
const swaggerSpec = swaggerJSDoc(require('./swaggerSpec'));
appRouter.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// API
appRouter.use('/', apiRouter);

app.use(`/.netlify/functions/api`, appRouter);

module.exports.handler = serverless(app);
