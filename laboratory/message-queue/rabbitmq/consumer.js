/*
 * @Author: Cphayim
 * @Date: 2019-12-19 14:52:20
 * @LastEditTime : 2019-12-19 14:53:44
 * @Description: 构建消费者
 */

const amqp = require('amqplib')

async function consumer() {
  // 创建连接对象
  const connection = await amqp.connect('amqp://localhost:5672', {
    clientProperties: {
      connection_name: '我是消费者'
    }
  })

  // 获取通道
  const channel = await connection.createChannel()

  // 声明参数
  const exchangeName = 'fanout_hello_exchange'
  const queueName = 'fanout_hello_queue'
  const routingKey = ''

  await channel.prefetch(2, false)

  // 声明交换机
  await channel.assertExchange(exchangeName, 'fanout', { durable: true })

  // 声明队列
  await channel.assertQueue(queueName)

  // 清空队列
  // await channel.purgeQueue(queueName)

  // 删除队列
  // await channel.deleteQueue(queueName)

  // 绑定关系（队列、交换机、路由键）
  await channel.bindQueue(queueName, exchangeName, routingKey)
  // 消费
  await channel.consume(
    queueName,
    msg => {
      console.log('Consumer', msg.content.toString())
      setTimeout(() => {
        channel.ack(msg)
      }, 1000)
    },
    { noAck: false }
  )

  console.log('消费端启动成功！')
}

consumer()
