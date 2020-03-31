const amqp = require('amqplib')

const URL = 'amqp://localhost:5672'
const EXCHANGE = ''
const EXCHANGE_TYPE = 'topic'
const QUEUE_NAME = 'api'
const ROUTING_KEY = 'api'

async function producer() {
  const connection = await amqp.connect(URL, {
    clientProperties: {
      connection_name: '我是生产者'
    }
  })
  const channel = await connection.createChannel()

  // await channel.assertExchange(EXCHANGE, EXCHANGE_TYPE)
  const flag = await channel.publish('', ROUTING_KEY, Buffer.from('我是消息'))
  if (flag) {
    console.log('发送成功')
    //  conn.close()
  } else {
    console.log('发送失败')
    //  conn.close()
  }
  // channel.close()
  // connection.close()
}

producer()
