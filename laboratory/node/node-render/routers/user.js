const KoaRouter = require('koa-router');
const userRouter = new KoaRouter();

userRouter.get('/user', (ctx, next) => {
  ctx.render('user/user', { title: '用户中心' });
});

module.exports = userRouter;
