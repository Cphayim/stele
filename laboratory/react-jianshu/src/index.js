/*
 * @Author: Cphayim
 * @Date: 1985-10-26 16:15:00
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:19:19
 * @Description:
 */
import React from 'react'
import ReactDOM from 'react-dom'
import 'normalize.css'
import * as serviceWorker from './serviceWorker'
import App from './App'


ReactDOM.render(<App />, document.getElementById('root'))

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister()
