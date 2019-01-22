/*
 * @Author: Cphayim
 * @Date: 2019-01-23 02:51:10
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:30:34
 * @Description: header actionCreator
 */
import * as constants from './constants'

export const searchFocus = (payload) => ({
  type: constants.SEARCH_FOCUS,
  payload
})

export const searchBlur = (payload) => ({
  type: constants.SEARCH_BLUR,
  payload
})
