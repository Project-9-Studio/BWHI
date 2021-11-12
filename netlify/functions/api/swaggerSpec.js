module.exports = {
    definition: {
        openapi: '3.0.0',
        info: {
          title: 'BWHI API',
          version: '1.0.0',
        },
      },
      apis: ['./netlify/functions/api/routes/*.js']
};
