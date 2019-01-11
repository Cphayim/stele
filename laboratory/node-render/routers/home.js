const KoaRouter = require('koa-router');
const homeRouter = new KoaRouter();

homeRouter.get(['/', '/index', '/index.html', '/home', '/home.html'], (ctx, next) => {
  ctx.state.todoList = [
    { name: '吃早饭', time: '2019.1.11 9:00' },
    { name: '吃午饭', time: '2019.1.10 12:30' },
    { name: '吃晚饭', time: '2019.1.10 19:30' }
  ];
  ctx.render('home/home', { title: '首页' });
});

module.exports = homeRouter;
