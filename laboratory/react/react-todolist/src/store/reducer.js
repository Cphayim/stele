import { CHANGE_INPUT_VALUE, ADD_TODO_ITEM, DELETE_TODO_ITEM } from './actionTypes'

const defaultState = {
  inputValue: '',
  list: []
}

export default (state = defaultState, { type, payload = {} }) => {
  const newState = JSON.parse(JSON.stringify(state))
  switch (type) {
    case CHANGE_INPUT_VALUE:
      newState.inputValue = payload.value
      break
    case ADD_TODO_ITEM:
      newState.inputValue && newState.list.push(newState.inputValue)
      newState.inputValue = ''
      break
    case DELETE_TODO_ITEM:
      newState.list.splice(payload.index, 1)
      break
    default:
  }
  return newState
}
