/*
 * @Author: Cphayim
 * @Date: 2019-12-05 10:49:00
 * @LastEditTime : 2019-12-19 14:52:30
 * @Description: 构建生产者
 */

const amqp = require('amqplib')

async function product(params) {
  // 创建连接对象
  const connection = await amqp.connect('amqp://localhost:5672')
  // 获取通道
  const channel = await connection.createChannel()
  // 声明参数
  // 交换机名
  const exchangeName = 'fanout_hello_exchange'
  // 路由键
  const routingKey = ''
  const msg = 'hello world'

  // 如果不存在交换机则创建
  await channel.assertExchange(exchangeName, 'fanout', { durable: true })

  for (let i = 0; i < 10000; i++) {
    // 发送消息
    await channel.publish(exchangeName, routingKey, Buffer.from(`${msg} 第${Math.random()}条消息`), {
      mandatory: true
    })
  }

  // await channel.publish(exchangeName, routingKey, Buffer.from(msg))

  // 关闭通道
  await channel.close()
  // 关闭连接
  await connection.close()
}

product()
