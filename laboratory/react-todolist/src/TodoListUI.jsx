import React from 'react'
import { Input, List } from 'antd'

export default function TodoListUI(props) {
  const { inputValue, list } = props
  return (
    <div className="wrapper" style={{ margin: '10px auto', maxWidth: '800px' }}>
      <div className="input-box">
        <Input.Search
          value={inputValue}
          placeholder={'请输入待办事项'}
          enterButton="提交"
          size="large"
          onChange={props.handleInputChange}
          onSearch={props.handleBtnClick}
        />
      </div>
      <div className="todo-list">
        <List
          bordered
          dataSource={list}
          renderItem={(item, index) => (
            <List.Item onClick={e => props.handelItemDelete(index, e)}>{item}</List.Item>
          )}
        />
      </div>
    </div>
  )
}
