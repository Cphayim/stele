const express = require('express');
const request = require('request');
const cheerio = require('cheerio');

const app = express();

app.get('/', (req, res) => {
  const HOST = 'https://juejin.im';
  request(`${HOST}/welcome/frontend`, (err, response, body) => {
    if (!err && response.statusCode === 200) {
      // 当前的 $ 是一个拿到了整个 body DOM 树的选择器
      const $ = cheerio.load(body, { decodeEntities: false });
      const elements = $('.entry-list>.item a.title');
      const list = elements.toArray().map(item => {
        const wraper = $(item);
        return {
          title: wraper.html(),
          link: HOST + wraper.attr('href')
        };
      });
      res.json(list);
    }
  });
});

app.listen(3000, () => {
  console.log('Server is running');
});
