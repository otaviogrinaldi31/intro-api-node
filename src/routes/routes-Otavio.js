const express = require('express');
const router = express.Router();

const RotasOtavio = require('./routes-Otavio');

router.use('/', RotasOtavio)

module.exports = router;