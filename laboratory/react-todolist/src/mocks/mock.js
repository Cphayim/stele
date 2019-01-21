const Mock = require('mockjs')

const data = Mock.mock({
  code: 0,
  message: 'ok',
  'data|1-20': ['@FIRST @FIRST @FIRST @FIRST']
})

console.log(JSON.stringify(data, null, 4))
