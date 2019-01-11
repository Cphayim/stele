/*
 * @Description: PM2 生态系统配置
 * @Author: Cphayim
 * @Date: 2019-01-11 21:06:40
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-12 02:46:16
 */
const path = require('path');
const os = require('os');

module.exports = {
  apps: [
    {
      name: 'API',
      script: './app.js',
      // Options reference: https://pm2.io/doc/en/runtime/reference/ecosystem-file/
      // args: 'one two',
      port: 3000, // process.env.PROT
      // 应用实例数，max 为 CPU 核心数
      instances: 1,
      // 是否崩溃自动重启
      autorestart: true,
      // 是否观察文件变动重启应用
      watch: true,
      // 忽略的目录或文件
      ignore_watch: ['./node_modules'],
      // 最大内存占用，超过则重启应用，防止内存泄漏
      max_memory_restart: '1G',

      /**
       * 日志相关配置
       * @see https://pm2.io/doc/en/runtime/guide/log-management/
       */
      // 标准输出日志文件位置，默认为 $HOME/.pm2/logs/${app_name}-out.log
      output: './logs/out.log', // 将日志发送到 '/dev/null' 来禁用
      // 错误输出日志文件位置，默认为 $HOME/.pm2/logs/${app_name}-error.log
      error: './logs/error.log', // 将日志发送到 '/dev/null' 来禁用
      // 是否将集群的日志合并成一个文件
      merge_logs: true,
      // 日志时间戳格式
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      // 日志类型
      // log_type: 'json',

      /**
       * 日志拆分
       * 如果希望将日志从一个大文件拆分为多个小文件，可以使用 pm2-logrotate
       * @see https://github.com/keymetrics/pm2-logrotate
       */

      /**
       * 延迟重启相关配置
       * @see https://pm2.io/doc/en/runtime/features/restart-strategies/
       */
      // 固定的重启延迟
      // restart_delay: 3000,
      // 重启延迟的递增值，第一次崩溃立即重启（restart_delay为0时），第二次崩溃等待100ms，第三次200ms以此类推...
      // 直到下一次成功启动30s内为崩溃将重置延迟时间
      // exp_backoff_restart_delay: 100,

      /**
       * 停机相关配置
       * @see https://pm2.io/doc/en/runtime/best-practices/graceful-shutdown
       */
      // pm2 在发出 SIGINT 信号通知应用退出到发出 SIGKILL 信号杀死进程的时间间隔
      kill_timeout: 1000,

      /**
       * 启动相关配置
       * @see https://pm2.io/doc/en/runtime/best-practices/graceful-shutdown
       */
      // 是否等待应用 ready
      wait_ready: true,
      // 默认情况下，在3000毫秒后，pm2会认为您的应用已准备就绪
      listen_timeout: 3000,

      /**
       * 环境变量
       */
      env: {
        // 默认环境变量
        // PORT: 3000,
        NODE_ENV: 'development'
      },
      env_test: {
        // 测试环境变量，通过 --env production 启动
        NODE_ENV: 'test'
      },
      env_production: {
        // 生产环境变量，通过 --env production 启动
        NODE_ENV: 'production'
      }
    }
  ],

  /**
   * 部署相关配置
   */
  deploy: {
    test: {
      key: path.resolve(os.homedir(), '.ssh/keys/local_ubuntu.key'),
      user: 'cphayim',
      host: ['10.211.55.7'],
      ssh_options: 'StrictHostKeyChecking=no',
      // GIT remote
      repo: 'git@github.com:Cphayim/stele.git',
      // GIT remote/branch
      ref: 'origin/dev',
      // 目录路径
      path: '/data/stele',
      // Setup: 在 GIT pull 之前执行的命令
      'pre-setup': 'ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts',
      // Setup: 在 GIT pull 成功后执行的命令
      'post-setup': 'pwd',
      // Deploy: 部署开始前的命令（本机！！！）
      'pre-deploy-local': "echo '开始部署'",
      // post-deploy action
      'post-deploy':
        'cd laboratory/node-pm2-nginx && npm install && pm2 startOrRestart ecosystem.config.js --env test'
    },
    production: {
      user: 'node',
      host: '212.83.163.1',
      ref: 'origin/master',
      repo: 'git@github.com:repo.git',
      path: '/var/www/production',
      'post-deploy': 'npm install && pm2 reload ecosystem.config.js --env production'
    }
  }
};
