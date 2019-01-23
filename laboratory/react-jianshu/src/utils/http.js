/*
 * @Author: Cphayim
 * @Date: 2019-01-23 21:40:11
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 21:53:04
 * @Description:
 */
import axios from 'axios'

import openMock from '../mocks'

if (process.env.NODE_ENV === 'development') {
  openMock()
}

const http = axios.create({
  baseURL: 'localhost:3000'
})

export default http
