/*
 * @Author: Cphayim
 * @Date: 2019-01-23 21:42:30
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 22:53:32
 * @Description:
 */
import Mock from 'mockjs'

const basicStruct = {
  code: 0,
  message: 'ok',
  timestamp: Date.now()
}

export default () => {
  Mock.mock(/\/headerList.json/, {
    ...basicStruct,
    'data|30': ['@cword(2,5)']
  })
}
