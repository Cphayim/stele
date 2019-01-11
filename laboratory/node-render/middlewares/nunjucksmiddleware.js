const path = require('path');

const nunjucks = require('nunjucks');
const moment = require('moment');

const nunjucksENV = new nunjucks.Environment(new nunjucks.FileSystemLoader('views'));

// 为 nunjucks 加入一个过滤器
nunjucksENV.addFilter('timeFormat', (time, format) => {
  return moment(new Date(time)).format(format || 'YYYY-MM-DD HH:mm:ss');
});

const defaultTplSuffix = 'html';
const genSuffixReg = (suffix = defaultTplSuffix) => {
  return new RegExp('\\' + suffix + '$');
};

const resolvePath = (params = {}, filePath) => {
  filePath = genSuffixReg(params.suffix).test(filePath)
    ? filePath
    : filePath + (params.suffix || defaultTplSuffix);
  return path.resolve(params.path || '', filePath);
};

/**
 * @description: nunjucks 中间件
 * @param {type}
 * @return:
 */
module.exports = params => {
  return (ctx, next) => {
    ctx.render = (filePath, renderData) => {
      ctx.type = 'text/html';
      ctx.body = nunjucksENV.render(
        resolvePath(params, filePath),
        Object.assign({}, ctx.state, renderData)
      );
    };
    next();
  };
};
