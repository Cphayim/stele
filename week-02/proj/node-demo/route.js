const url = require('url');

const route = (req, res) => {
  const path = url.parse(req.url).path;
  console.log(`path: ${path}`);
  if (path === '/') {
    res.write('Hello world.');
  } else if (path === '/home') {
    res.write('Hello home.');
  } else {
    res.writeHead(404);
    res.write('404 NotFound');
  }
  res.end();
};

module.exports = route;
