const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello world!');
});

/**
 * 优雅的部署
 * 我们的应用如果遇到崩溃，或是我们在部署重启时，用户可能会遇到两个问题：
 * 1. 一个503响应，服务器在停机期间响应的错误
 * 2. 一个失败的请求，当一个请求还未完成响应时重启了应用
 * 因此我们需要优雅的停机和启动
 */

/**
 * 优雅的启动
 * 在提供HTTP请求之前，应用程序通常需要连接到数据库或其他资源
 * 我们的应用在启动前经过以下3个步骤来避免错误
 * 1. 打开数据库连接
 * 2. 监听端口
 * 3. 发送 ready 信号通知 pm2 应用准备就绪
 */

const server = require('http').createServer(app);
// 这里连接数据库等资源，成功后监听端口
server.listen(port, () => {
  console.log('Express server listening on port ' + server.address().port);
  // 发送 ready 信号通知 pm2 应用准备就绪，需要在ecosystem.config.js设置wait_ready为 true
  process.send('ready');
  // 默认情况下，在3000毫秒后，即使不发送 ready pm2也会认为您的应用已准备就绪
  // 在ecosystem.config.js中设置listen_timeout更改此值。
});

/**
 * 优雅的停机
 * 我们的应用需要在停机前经过5个步骤：
 * 1. 收到停止通知
 * 2. 要求负载均衡器停止接收请求
 * 3. 完成所有正在进行的请求
 * 4. 释放所有资源（数据库，队列......）
 * 5. 退出进程
 */
// pm2 向应用发出 SIGINT 信号通知即将杀死进程
// 默认情况下，pm2会在发送 SIGKILL 信号之前等待1600ms
// 可以在ecosystem.config.js中以ms为单位更改此值：kill_timeout
process.on('SIGINT', () => {
  // 停止服务器接受新请求并完成现有请求
  server.close(err => {
    if (err) {
      console.err(err);
      process.exit(1);
    }
    // 在这里释放资源，如断开数据库
    process.exit(0);
  });
});
