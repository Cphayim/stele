const routers = [
  require('./home'),
  require('./user'),
];

module.exports = function(app) {
  routers.forEach(router => {
    app.use(router.routes());
    app.use(router.allowedMethods())
  });
};
