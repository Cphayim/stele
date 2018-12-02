const http = require('http');

const server = route => {
  const requestListener = (req, res) => {
    if (typeof route === 'function') {
      route(req, res);
    }
  };
  http.createServer(requestListener).listen(8888);
  console.log('Server is runing.');
};

module.exports = server;
