/*
 * @Author: Cphayim
 * @Date: 2019-01-23 01:38:02
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:25:08
 * @Description: redux store 入口
 */
import { createStore, compose } from 'redux'

import reducer from './reducer'

const composeEnhancers =
  typeof window === 'object' && window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__
    ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({})
    : compose

const enhancer = composeEnhancers()

const store = createStore(reducer, enhancer)

export default store
