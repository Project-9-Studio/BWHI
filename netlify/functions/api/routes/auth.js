const express = require('express');
const GoTrue = require('gotrue-js').default;

const router = express.Router();
const auth = new GoTrue({
    APIUrl: 'https://bwhi.netlify.app/.netlify/identity'
});

/**
 * @openapi
 * /auth/signup:
 *  post:
 *      description: BWHI sign up
 *      responses:
 *          200:
 *              description: Returns json object with signed in user.
 */
router.post("/signup", async (req, res) => {
    const user = await auth.signup(req.body.email, req.body.password);
    res.json(user);
});

/**
 * @openapi
 * /auth/confirm:
 *  post:
 *      description: BWHI confirm sign up
 *      responses:
 *          200:
 *              description: Returns json object with signed in user.
 */
router.post("/confirm", async (req, res) => {
    const { response } = await auth.confirm(req.body.token, true);
    res.json(response);
});

/**
 * @openapi
 * /auth/login:
 *  post:
 *      description: BWHI login
 *      responses:
 *          200:
 *              description: Returns json object with status of login
 */
router.post("/login", async (_, res) => {
    const { response } = await auth.login(req.body.email, req.body.password, req.body.remember);
    res.json(response);
});

/**
 * @openapi
 * /auth/logout:
 *  post:
 *      description: BWHI logout
 *      responses:
 *          200:
 *              description: Returns json object with status of logout
 */
router.post("/logout", (_, res) => {
    res.json({});
});

module.exports = router;
