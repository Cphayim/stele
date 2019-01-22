/*
 * @Author: Cphayim
 * @Date: 1985-10-26 16:15:00
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:19:14
 * @Description:
 */
import React, { Component } from 'react'
import { Provider } from 'react-redux'

import GlobalStyle from './style'
import Header from './common/header'
import store from './store'

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <GlobalStyle />
        <Header />
      </Provider>
    )
  }
}

export default App
