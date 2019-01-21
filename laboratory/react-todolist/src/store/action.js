import { ADD_TODO_ITEM, CHANGE_INPUT_VALUE, DELETE_TODO_ITEM } from './actionTypes'

export const getChangeInputValueAction = payload => ({
  type: CHANGE_INPUT_VALUE,
  payload
})

export const getAddTodoItemAction = payload => ({
  type: ADD_TODO_ITEM,
  payload
})

export const getDeleteTodoItemAction = payload => ({
  type: DELETE_TODO_ITEM,
  payload
})
