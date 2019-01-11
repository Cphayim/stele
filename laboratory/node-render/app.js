const path = require('path');

const Koa = require('koa');
const koaStatic = require('koa-static');
const bindRouter = require('./routers');
const nunjucksMiddleware = require('./middlewares/nunjucksmiddleware');

const app = new Koa();

// 在绑定路由之前注册 nunjucks 中间件
app.use(koaStatic(path.resolve('dist')));
app.use(nunjucksMiddleware({ path: path.resolve(__dirname, 'views'), suffix: '.html' }));

// 绑定路由
bindRouter(app);

app.listen(3000, () => console.log('Server is running.'));
