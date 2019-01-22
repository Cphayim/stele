import React, { Component } from 'react'
import classNames from 'classnames'
import { CSSTransition } from 'react-transition-group'

import {
  HeaderWrapper,
  Logo,
  Nav,
  NavItem,
  NavSearchWrapper,
  NavSearch,
  Addition,
  Button
} from './style'

class Header extends Component {
  constructor(props) {
    super(props)

    this.state = {
      focused: false
    }
  }

  render() {
    const { focused } = this.state

    const navSearchClass = classNames({ focused })
    const navSearchIconClass = classNames('iconfont', { focused })

    return (
      <HeaderWrapper>
        <Logo href={'/'} />
        <Nav>
          <NavItem className="left active" children={'首页'} />
          <NavItem className="left" children={'下载App'} />
          <NavItem className="right" children={'登录'} />
          <NavItem className="right" children={<i className="iconfont">&#xe636;</i>} />
          <NavSearchWrapper>
            <CSSTransition timeout={200} in={focused} classNames={'slide'}>
              <NavSearch
                className={navSearchClass}
                onFocus={this.handleInputFocus}
                onBlur={this.handleInputBlur}
              />
            </CSSTransition>
            <i className={navSearchIconClass}>&#xe60b;</i>
          </NavSearchWrapper>
        </Nav>
        <Addition>
          <Button>
            <i className="iconfont">&#xe615;</i>
            写文章
          </Button>
          <Button hollow>注册</Button>
        </Addition>
      </HeaderWrapper>
    )
  }

  handleInputFocus = e => {
    this.setState({
      focused: true
    })
  }

  handleInputBlur = e => {
    this.setState({
      focused: false
    })
  }
}

export default Header
