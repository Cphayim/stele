/*
 * @Author: Cphayim
 * @Date: 2019-01-23 02:13:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-24 03:39:06
 * @Description: header reducer
 */
import { fromJS } from 'immutable'

import * as constants from './constants'

const initialState = fromJS({
  focused: false,
  mouseIn: false,
  // 搜索推荐状态
  list: [],
  pageSize: 10, // 每页数量
  page: 1, // 当前页码
  totalPage: 1 // 总页数
})

export default (state = initialState, { type, payload }) => {
  // immutable 对象的 set 方法，会结合之前 immutable 对象的值 和设置的值，返回一个全新的对象
  switch (type) {
    case constants.SEARCH_FOCUS:
      return state.set('focused', true)

    case constants.SEARCH_BLUR:
      return state.set('focused', false)

    case constants.CHANGE_LIST:
      return state.merge({
        list: payload.list,
        totalPage: payload.totalPage
      })

    case constants.MOUSE_ENTER:
      return state.set('mouseIn', true)

    case constants.MOUSE_LEAVE:
      return state.set('mouseIn', false)

    case constants.CHANGE_PAGE:
      return state.set('page', payload.nextPage)

    default:
      return state
  }
}
