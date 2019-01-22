import React, { Component, Fragment } from 'react'

import GlobalStyle from './style'

import Header from './common/header'

class App extends Component {
  render() {
    return (
      <Fragment>
        <GlobalStyle />
        <Header />
      </Fragment>
    )
  }
}

export default App
