const placeOrderController = require('../controllers/placeOrder.controller')
const express = require('express')
const router = express.Router()


router.post('/placeOrder', placeOrderController.placeOrderController)

module.exports = router