import React from 'react'
import { connect } from 'react-redux'
import styled from '@emotion/styled'
import { Input, List, Button } from 'antd'

import {
  getChangeInputValueAction,
  getAddTodoItemAction,
  getDeleteTodoItemAction
} from './store/action'

function TodoList(props) {
  // console.log(this.props)
  const { inputValue, list, handleInputChange, handleAddItem, handleDeleteItem } = props
  return (
    <Container>
      <InputWrap style={{ display: 'flex' }}>
        <Input value={inputValue} onChange={handleInputChange} onPressEnter={handleAddItem} />
        <Button style={{ marginLeft: '10px' }} type="primary" onClick={handleAddItem}>
          提交
        </Button>
      </InputWrap>

      <List
        bordered
        dataSource={list}
        renderItem={(item, index) => (
          <List.Item onClick={e => handleDeleteItem(index, e)}>{item}</List.Item>
        )}
      />
    </Container>
  )
}

// 把 store 内的 state 映射到组件的 props 上
// store 上 state 与组件 props 的对应关系
const mapStateToProps = state => {
  return {
    inputValue: state.inputValue,
    list: state.list
    // ...state
  }
}

// 把 store.dispatch 映射到组件的 props 上
// 可以添加一些 dispatch action 的方法到 props
const mapDispatchToProps = dispatch => {
  return {
    dispatch,
    handleInputChange(e) {
      const action = getChangeInputValueAction({ value: e.target.value })
      dispatch(action)
    },
    handleAddItem(e) {
      const action = getAddTodoItemAction()
      dispatch(action)
    },
    handleDeleteItem(index, e) {
      const action = getDeleteTodoItemAction({ index })
      dispatch(action)
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList)

const Container = styled('div')({
  maxWidth: '800px',
  margin: '20px auto'
})

const InputWrap = styled('div')({
  display: 'flex',
  marginBottom: '10px'
})
