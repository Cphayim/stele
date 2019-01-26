/*
 * @Author: Cphayim
 * @Date: 2019-01-23 21:40:11
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 22:55:00
 * @Description:
 */
import axios from 'axios'

import openMock from '../mocks'

if (process.env.NODE_ENV === 'development') {
  openMock()
}

const http = axios.create({
  baseURL: '//localhost:3000'
})

export default http
