/*
 * @Author: Cphayim
 * @Date: 2019-02-01 00:01:14
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 00:40:24
 * @Description:
 */

import { fromJS } from 'immutable'
import * as constants from './constants'

const initialState = fromJS({
  logined: false
})

export default (state = initialState, { type, payload }) => {
  switch (type) {
    case constants.CHANGE_LOGIN_STATUS:
      return state.set('logined', payload.status)
    default:
      return state
  }
}
