import React from 'react'
import ReactDOM from 'react-dom'
import { LocaleProvider } from 'antd'
import zhCN from 'antd/lib/locale-provider/zh_CN'

import TodoList from './TodoList'


ReactDOM.render(<LocaleProvider locale={zhCN}><TodoList /></LocaleProvider>, document.getElementById('root'))
