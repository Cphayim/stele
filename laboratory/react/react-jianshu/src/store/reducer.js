/*
 * @Author: Cphayim
 * @Date: 2019-01-23 01:38:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 00:04:03
 * @Description: 收集 reducer 并合并
 */
// 需要每个 state 子模块都是 immutable 对象，使用 redux-immutable 的 combineReducers
// 如果不需要则使用 redux 的 combineReducers
import { combineReducers } from 'redux-immutable'

import { reducer as headerReducer } from '../common/header/store'
import { reducer as homeReducer } from '../pages/home/store'
import { reducer as detailReducer } from '../pages/detail/store'
import { reducer as loginReducer } from '../pages/login/store'

const initalState = {}

export default combineReducers({
  default: (state = initalState, action) => state,
  header: headerReducer,
  home: homeReducer,
  detail: detailReducer,
  login: loginReducer
})
