import axios from 'axios'
import Mock from 'mockjs'

import { CHANGE_INPUT_VALUE, ADD_TODO_ITEM, DELETE_TODO_ITEM, INIT_TODO_LIST } from './actionTypes'

export const getChangeInputAction = value => ({
  type: CHANGE_INPUT_VALUE,
  value
})

export const getAddItemAction = () => ({
  type: ADD_TODO_ITEM
})

export const getDeleteItemAction = index => ({
  type: DELETE_TODO_ITEM,
  index
})

export const getInitListAction = list => ({
  type: INIT_TODO_LIST,
  list
})

export const getTodoList = () => {
  return (dispatch) =>{
    Mock.mock(/\/list.json$/, {
      code: 0,
      message: 'ok',
      timestamp: Date.now(),
      'data|0-100': ['@FIRST @FIRST @FIRST @FIRST']
    })
    axios
      .get('/list.json')
      .then(res => {
        console.log(res)
        const action = getInitListAction(res.data.data)
        dispatch(action)
      })
      .catch(err => {
        console.error(err)
      })
  }
}
