/*
 * @Author: Cphayim
 * @Date: 2019-01-27 18:56:17
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 01:31:10
 * @Description:
 */

import { fromJS } from 'immutable'
import { constants } from '.'
// import * as constants from './constants'

const initialState = fromJS({
  title: '',
  content: ``
})

export default (state = initialState, { type, payload }) => {
  switch (type) {
    case constants.CHANGE_DETAIL:
      return state.merge(fromJS(payload))
    default:
      return state
  }
}
