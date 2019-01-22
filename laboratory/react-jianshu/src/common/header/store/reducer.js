/*
 * @Author: Cphayim
 * @Date: 2019-01-23 02:13:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:30:21
 * @Description: header reducer
 */
import * as constants from './constants'

const initialState = {
  focused: false
}

export default (state = initialState, { type, payload }) => {
  const newState = JSON.parse(JSON.stringify(state))
  switch (type) {
    case constants.SEARCH_FOCUS:
      newState.focused = true
      break
    case constants.SEARCH_BLUR:
      newState.focused = false
      break
    default:
  }
  return newState
}
