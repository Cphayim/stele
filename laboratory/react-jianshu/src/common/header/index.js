/*
 * @Author: Cphayim
 * @Date: 2019-01-22 17:03:40
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:24:44
 * @Description: Header 组件
 */
import React from 'react'
import { connect } from 'react-redux'
import classNames from 'classnames'
import { CSSTransition } from 'react-transition-group'

import { actionCreators } from './store'
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

const Header = props => {
  const { focused, handleInputFocus, handleInputBlur } = props

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
              onFocus={handleInputFocus}
              onBlur={handleInputBlur}
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

const mapStateToProps = state => {
  return {
    focused: state.header.focused
  }
}

const mapDispatchToProps = dispatch => {
  return {
    dispatch,
    handleInputFocus(e) {
      dispatch(actionCreators.searchFocus())
    },
    handleInputBlur(e) {
      dispatch(actionCreators.searchBlur())
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Header)
