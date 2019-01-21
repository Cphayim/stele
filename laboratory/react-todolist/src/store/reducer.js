import { CHANGE_INPUT_VALUE, ADD_TODO_ITEM, DELETE_TODO_ITEM, INIT_TODO_LIST } from './actionTypes'

const defaultState = {
  inputValue: '',
  list: []
}

// reducer 可以接收 state，但绝不能修改 state
export default (state = defaultState, action) => {
  // console.log(state, action)
  // 创建一个深拷贝的对象
  const newState = JSON.parse(JSON.stringify(state))
  if (action.type === CHANGE_INPUT_VALUE) {
    newState.inputValue = action.value
  } else if (action.type === ADD_TODO_ITEM) {
    if (newState.inputValue) {
      newState.list.push(newState.inputValue)
      newState.inputValue = ''
    }
  } else if (action.type === DELETE_TODO_ITEM) {
    newState.list.splice(action.index, 1)
  } else if (action.type === INIT_TODO_LIST) {
    newState.list = action.list
  }
  return newState
}
