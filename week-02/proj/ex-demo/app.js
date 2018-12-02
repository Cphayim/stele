const express = require('express');
const swig = require('swig-templates');
const app = express();

swig.setDefaults({ cache: false });

app.engine('tpl', swig.renderFile);
app.set('view engine', 'tpl');
app.set('views', `${__dirname}/views`);

app.use(express.static('public'));

app.get('/', (req, res) => {
  res.render('index', {
    title: '首页',
    model: {
      content: 'Hello world'
    }
  });
});

app.listen(3000, () => console.log('Server is running.'));

// log4j
