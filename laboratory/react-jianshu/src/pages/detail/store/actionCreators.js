/*
 * @Author: Cphayim
 * @Date: 2019-01-27 18:55:59
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-30 17:15:22
 * @Description:
 */
import http from '../../../utils/http'
import { constants } from '.'

export const getDetail = id => {
  return async (dispatch, getState) => {
    const { data: res } = await http.get('/detail.json', {
      params: {
        id
      }
    })
    dispatch(changeDetail(res.data))
  }
}

const changeDetail = payload => ({
  type: constants.CHANGE_DETAIL,
  payload
})
