const express = require('express')

//create express app
const app = express();
app.use(express.json())
app.use(express.urlencoded())

//setup server port
const port = process.env.port || 4000;


//define root route
app.get('/', (req, res) => {
    res.send('Place Order API')
})

//placeOrder API
const placeOrderRouter = require('./src/router/placeOrder')
app.use('/admin', placeOrderRouter)

//listen the port 
app.listen(port, () => {
    console.log(`Express Server is running on localhost:${port} port`)
})

