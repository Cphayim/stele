/*
 * @Author: Cphayim
 * @Date: 2020-06-05 14:30:37
 * @LastEditTime: 2020-06-28 15:28:25
 * @Description:
 */
import express from 'express'
import { ResponseBody } from '../libs/response'
import { mock } from 'mockjs'

const router = express.Router()

router.post('/', (req, res) => {
  const mockData = mock({
    name: '@cname',
    'age|10-30': 0,
  })
  setTimeout(() => {
    res.json(new ResponseBody({ data: mockData }))
  }, 2000)
})

export default router
