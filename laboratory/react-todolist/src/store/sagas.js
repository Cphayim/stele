import axios from 'axios'
import Mock from 'mockjs'
import { takeEvery, put } from 'redux-saga/effects'

import { GET_INIT_LIST } from './actionTypes'
import { getInitListAction } from './action'

function* fetchInitList(action) {
  Mock.mock(/\/list.json$/, {
    code: 0,
    message: 'ok',
    timestamp: Date.now(),
    'data|0-100': ['@FIRST @FIRST @FIRST @FIRST']
  })

  try {
    const res = yield axios.get('/list.json')
    const action = getInitListAction(res.data.data)
    yield put(action)
  } catch (error) {
    console.error(error)
  }
}

function* todoSaga() {
  yield takeEvery(GET_INIT_LIST, fetchInitList)
}

export default todoSaga
