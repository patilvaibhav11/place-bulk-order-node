const placeOrderService = require('../service/placeOrder.service')

module.exports.placeOrderController = (req, res) => {
    placeOrderService.placeOrderService(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
}