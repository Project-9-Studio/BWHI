const jwt = require("express-jwt");
const jwks = require("jwks-rsa");

const jwtCheck = jwt({
    secret: jwks.expressJwtSecret({
        cache: true,
        rateLimit: true,
        jwksRequestsPerMinute: 5,
        jwksUri: 'https://dev-qtbcszl1.us.auth0.com/.well-known/jwks.json'
  }),
  audience: 'https://bwhi/api',
  issuer: 'https://dev-qtbcszl1.us.auth0.com/',
  algorithms: ['RS256']
});

module.exports = jwtCheck;
