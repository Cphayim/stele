/*
 * @Author: Cphayim
 * @Date: 2019-01-25 16:11:44
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 23:17:16
 * @Description:
 */
import http from '../../../utils/http'
import * as constants from './constants'

export const getHomeData = () => {
  return async dispath => {
    const { data: res } = await http.get('/homeData.json')
    const action = changeHomeData(res.data)
    dispath(action)
  }
}

const changeHomeData = payload => ({
  type: constants.CHANGE_HOME_DATA,
  payload
})

export const getMoreList = cursor => {
  return async dispath => {
    const { data: res } = await http.get('/api/homeList.json', { params: { cursor } })
    const action = addHomeList(res.data)
    dispath(action)
  }
}

const addHomeList = payload => ({
  type: constants.ADD_ARTICLE_LIST,
  payload
})
