const database = require('../../dbConfig/db.conig')

module.exports.placeOrderService = (data) => {
    const {
        user_name,
        contact_no,
        city,
        product_id,
        product_rate,
        product_quantity
    } = data
    return new Promise((resolve, reject) => {
        const insertOrderQuery = `
        INSERT INTO tb_order_master (
            user_name, 
            contact_no, 
            city) VALUES(
                '${user_name}',
                '${contact_no}',
                '${city}'
            )
        `
        console.log(insertOrderQuery)
        database.query(insertOrderQuery, (getErr, insertRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: -1,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            }else {
                const orderID = insertRow.insertId
                const product_ids = product_id.split(',')
                const product_rates = product_rate.split(',')
                const product_quantitys = product_quantity.split(',')
                //For adding multiple values , Use ( ? ) ==>  insert ..() values ?
                const orderDetailQuery = `
                INSERT INTO tb_order_details_master(
                    order_id,
                    product_id,
                    product_rate,
                    product_quantity,
                    product_final_amount
                    )VALUES ?
                `
                const data = []
                product_ids.forEach((element , index) => {
                   const products = []
                   products.push(orderID) 
                   products.push(element) 
                   products.push(product_rates[index])
                   products.push(product_quantitys[index])
                   products.push(product_rates[index]*product_quantitys[index])
                   data.push(products)
                });
                console.log(orderDetailQuery, data)
                database.query(orderDetailQuery, [data] , (detailErr, detailRow) => {
                    if(detailErr){
                        reject({
                            ack:false,
                            resCode:-1,
                            msg: detailErr.sqlMessage
                        })
                    }else{
                        resolve({
                            ack:true,
                            resCode:1,
                            msg:'Order Placed Sucessfully'
                        })
                    }
                })
            }
            
        })
    })
}