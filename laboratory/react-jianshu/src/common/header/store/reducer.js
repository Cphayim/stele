/*
 * @Author: Cphayim
 * @Date: 2019-01-23 02:13:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 20:43:55
 * @Description: header reducer
 */
import { fromJS } from 'immutable'

import * as constants from './constants'

const initialState = fromJS({
  focused: false
})

export default (state = initialState, { type, payload }) => {
  if (type === constants.SEARCH_FOCUS) {
    // immutable 对象的 set 方法，会结合之前 immutable 对象的值 和设置的值，返回一个全新的对象
    return state.set('focused', true)
  } else if (type === constants.SEARCH_BLUR) {
    return state.set('focused', false)
  }
  // const newState = JSON.parse(JSON.stringify(state))
  // switch (type) {
  //   case constants.SEARCH_FOCUS:
  //     newState.focused = true
  //     break
  //   case constants.SEARCH_BLUR:
  //     newState.focused = false
  //     break
  //   default:
  // }
  return state
}
