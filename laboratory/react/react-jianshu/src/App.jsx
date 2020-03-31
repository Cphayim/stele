/*
 * @Author: Cphayim
 * @Date: 2019-01-23 16:15:00
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 01:25:40
 * @Description:
 */
import React, { Component, Fragment } from 'react'
import { Provider } from 'react-redux'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import GlobalStyle from './style'
import Header from './common/header'
import store from './store'

import Home from './pages/home'
import Detail from './pages/detail/loadable'
import Login from './pages/login'
import Write from './pages/write'

import BackTop from './common/backtop'

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <GlobalStyle />
        <Router>
          <Fragment>
            <Header />
            <Route path="/" exact component={Home} />
            <Route path="/detail/:id" component={Detail} />
            <Route path="/login" component={Login} />
            <Route path="/write" component={Write} />
          </Fragment>
        </Router>
        <BackTop />
      </Provider>
    )
  }
}

export default App
