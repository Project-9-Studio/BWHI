const express = require('express');
const router = express.Router();

/**
 * @openapi
 * /:
 *  get:
 *      description: BWHI API api
 *      responses:
 *          200:
 *              description: Returns json object with status of api
 */
router.get("/", (_, res) => {
    res.json({
      name: "BWHI API",
      version: "0.0.1"
    });
});


router.use("/auth", require("./auth"));

module.exports = router;
