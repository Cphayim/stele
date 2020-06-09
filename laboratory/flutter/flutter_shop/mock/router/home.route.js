/*
 * @Author: Cphayim
 * @Date: 2020-06-05 14:06:29
 * @LastEditTime: 2020-06-09 16:33:13
 * @Description:
 */

import express from 'express'
import { mock } from 'mockjs'
import { ResponseBody } from '../libs/response'

const router = express.Router()

router.get('/', (req, res) => {
  const mockData = mock({
    'list|4': [
      {
        name: '@cname',
        'age|13-25': 18,
      },
    ],
  })
  res.json(new ResponseBody({ data: mockData.list, code: 500 }))
})

export default router
