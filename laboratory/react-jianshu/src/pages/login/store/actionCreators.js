/*
 * @Author: Cphayim
 * @Date: 2019-02-01 00:00:52
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 00:53:31
 * @Description:
 */
import http from '../../../utils/http'
import { constants } from '.'

export const login = (account, password) => {
  return async dispatch => {
    const { data: res } = await http.post('/login', { account, password })
    if (!res.code) {
      dispatch(changeLoginStatus({ status: true }))
    } else {
      alert('登录失败')
    }
  }
}

export const logout = () => {
  return async dispatch => {
    const { data: res } = await http.post('/logout')
    if (!res.code) {
      dispatch(changeLoginStatus({ status: false }))
    } else {
      alert('退出失败')
    }
  }
}

const changeLoginStatus = payload => ({
  type: constants.CHANGE_LOGIN_STATUS,
  payload
})
