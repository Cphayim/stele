/*
 * @Author: Cphayim
 * @Date: 2019-01-23 01:38:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:27:24
 * @Description: 收集 reducer 并合并
 */
import { combineReducers } from 'redux'

import { reducer as headerReducer } from '../common/header/store/'

const initalState = {}

export default combineReducers({
  default: (state = initalState, action) => state,
  header: headerReducer
})
