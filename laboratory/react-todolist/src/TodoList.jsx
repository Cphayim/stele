import React, { Component } from 'react'

import store from './store'
import {
  getChangeInputAction,
  getAddItemAction,
  getDeleteItemAction,
  getInitList
} from './store/action'
import TodoListUI from './TodoListUI'

export default class TodoList extends Component {
  constructor(props) {
    super(props)
    this.state = store.getState()
    store.subscribe(this.handleStoreChange)
  }

  componentDidMount() {
    const action = getInitList()
    store.dispatch(action)
  }

  render() {
    const { inputValue, list } = this.state
    return (
      <TodoListUI
        inputValue={inputValue}
        list={list}
        handleInputChange={this.handleInputChange}
        handleBtnClick={this.handleBtnClick}
        handelItemDelete={this.handelItemDelete}
      />
    )
  }

  handleStoreChange = _ => {
    this.setState(store.getState())
  }

  handleInputChange = e => {
    const action = getChangeInputAction(e.target.value)
    store.dispatch(action)
  }

  handleBtnClick = e => {
    const action = getAddItemAction()
    store.dispatch(action)
  }

  handelItemDelete = (index, e) => {
    const action = getDeleteItemAction(index)
    store.dispatch(action)
  }
}
