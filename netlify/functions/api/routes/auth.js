const express = require('express');

const router = express.Router();
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const verifyServiceId = process.env.TWILIO_SERVICE_ID;
const twilioClient = require('twilio')(accountSid, authToken);

/**
 * @openapi
 * /auth/sendToken:
 *  post:
 *      description: Sends verification code to BWHI user
 *      responses:
 *          200:
 *              description: Returns json object with signed in user.
 */
router.post("/sendToken", async (req, res) => {
    const response = await twilioClient.verify.services(verifyServiceId).verifications
                                .create({ to: req.body.to, channel: 'sms' });
    console.log(response);
    res.json(true);
});

/**
 * @openapi
 * /auth/verifyToken:
 *  post:
 *      description: Verifies code sent to BWHI user
 *      responses:
 *          200:
 *              description: Returns json object with signed in user.
 */
router.post("/verifyToken", async (req, res) => {
    const response = await twilioClient.verify.services(verifyServiceId).verificationChecks
                                .create({ to: req.body.to, code: req.body.code });
    console.log(response);
    res.json(response);
});

module.exports = router;
