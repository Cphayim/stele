module.exports = {
  apps : [{
    name: 'node-render',
    script: 'app.js',
    instances: 1,
    autorestart: true,
    watch: true,
    ignore_watch: ['node_modules'],
    output: './logs/output.log',
    error: './logs/error.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss',
    merge_logs: true,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development'
    },
    env_production: {
      NODE_ENV: 'production'
    }
  }]
};
