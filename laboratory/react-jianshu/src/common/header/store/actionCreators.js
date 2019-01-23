/*
 * @Author: Cphayim
 * @Date: 2019-01-23 02:51:10
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-24 03:28:51
 * @Description: header actionCreator
 */
import { fromJS } from 'immutable'

import http from '../../../utils/http'
import * as constants from './constants'

/**
 * 搜索框聚焦/失焦
 */
export const searchFocus = payload => ({
  type: constants.SEARCH_FOCUS
})
export const searchBlur = payload => ({
  type: constants.SEARCH_BLUR
})

/**
 * 获取搜索推荐列表数据
 */
export const getList = () => {
  return async dispatch => {
    try {
      const { data: res } = await http.get('/headerList.json')
      // state 中的 list 是 immutable 的 List 类型对象，需要转换
      const action = changeList({
        list: fromJS(res.data),
        totalPage: Math.ceil(res.data.length / 10)
      })
      dispatch(action)
    } catch (error) {
      console.error(error)
    }
  }
}

/**
 * 搜索推荐列表显示/隐藏
 */
export const mouseEnter = payload => ({
  type: constants.MOUSE_ENTER
})
export const mouseLeave = payload => ({
  type: constants.MOUSE_LEAVE
})

/**
 * 搜索推荐-换一批
 * @param {{nextPage: number}} payload
 */
export const changePage = payload => ({
  type: constants.CHANGE_PAGE,
  payload
})

/**
 * 改变搜索推荐列表数据
 * @param {{list: string[]}} payload
 */
const changeList = payload => ({
  type: constants.CHANGE_LIST,
  payload
})
