import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { LocaleProvider } from 'antd'
import zhCN from 'antd/lib/locale-provider/zh_CN'

import TodoList from './TodoList'
import store from './store'

const App = (
  <Provider store={store}>
    <LocaleProvider locale={zhCN}>
      <TodoList className={'娃哈哈'} />
    </LocaleProvider>
  </Provider>
)

ReactDOM.render(App, document.getElementById('root'))
