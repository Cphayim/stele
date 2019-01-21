import { CHANGE_INPUT_VALUE, ADD_TODO_ITEM, DELETE_TODO_ITEM, INIT_TODO_LIST, GET_INIT_LIST } from './actionTypes'

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

export const getInitList = () => ({
  type: GET_INIT_LIST
})
