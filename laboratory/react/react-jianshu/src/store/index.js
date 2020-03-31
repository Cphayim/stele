/*
 * @Author: Cphayim
 * @Date: 2019-01-23 01:38:02
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 21:33:21
 * @Description: redux store 入口
 */
import { createStore, compose, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'

import reducer from './reducer'

const composeEnhancers =
  typeof window === 'object' && window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__
    ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({})
    : compose

const enhancer = composeEnhancers(applyMiddleware(thunk))

const store = createStore(reducer, enhancer)

export default store
