/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:45:43
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-27 18:57:23
 * @Description:
 */

import { fromJS } from 'immutable'
import * as constants from './constants'

const initialState = fromJS({
  bannerImgUrl: '',
  topicList: [],
  articleList: [],
  recommendList: []
})

export default (state = initialState, { type, payload }) => {
  // immutable 对象的 set 方法，会结合之前 immutable 对象的值 和设置的值，返回一个全新的对象
  switch (type) {
    case constants.CHANGE_HOME_DATA:
      return fromJS(payload)
    case constants.ADD_ARTICLE_LIST:
      return state.set('articleList', state.get('articleList').concat(fromJS(payload.articleList)))
    default:
      return state
  }
}
