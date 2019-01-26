/*
 * @Author: Cphayim
 * @Date: 2019-01-22 17:03:40
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-26 00:09:48
 * @Description: Header 组件
 */
import React, { Component } from 'react'
import { Link } from 'react-router-dom'
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
  SearchInfo,
  SearchInfoTitle,
  SearchInfoSwitch,
  SearchInfoList,
  SearchInfoItem,
  Addition,
  Button
} from './style'

class Header extends Component {
  getListArea(show) {
    const {
      focused,
      mouseIn,
      list,
      pageSize,
      page,
      totalPage,
      handleMouseEnter,
      handleMouseLeave,
      handleChangePage
    } = this.props

    if (!focused && !mouseIn) return null

    const pageList = list.toJS().slice((page - 1) * pageSize, page * pageSize)

    if (!pageList.length) return null

    return (
      <SearchInfo onMouseEnter={handleMouseEnter} onMouseLeave={handleMouseLeave}>
        <SearchInfoTitle>
          热门搜索
          <SearchInfoSwitch onClick={e => handleChangePage(page, totalPage, this.spinicon, e)}>
            <i ref={icon => (this.spinicon = icon)} className="iconfont spin">
              &#xe851;
            </i>
            换一批
          </SearchInfoSwitch>
        </SearchInfoTitle>
        <SearchInfoList>
          {pageList.map(item => (
            <SearchInfoItem key={item}>{item}</SearchInfoItem>
          ))}
        </SearchInfoList>
      </SearchInfo>
    )
  }

  render() {
    const { focused, list, handleInputFocus, handleInputBlur } = this.props
    const navSearchClass = classNames({ focused })
    const navSearchIconClass = classNames('iconfont', 'zoom', { focused })

    return (
      <HeaderWrapper>
        <Link to={'/'}>
          <Logo />
        </Link>
        <Nav>
          {/* 按钮 */}
          <NavItem className="left active" children={'首页'} />
          <NavItem className="left" children={'下载App'} />
          <NavItem className="right" children={'登录'} />
          <NavItem className="right" children={<i className="iconfont">&#xe636;</i>} />
          {/* /按钮 */}
          {/* 搜索框 */}
          <NavSearchWrapper>
            <CSSTransition timeout={200} in={focused} classNames={'slide'}>
              <NavSearch
                className={navSearchClass}
                onFocus={e => handleInputFocus(!list.size, e)}
                onBlur={handleInputBlur}
              />
            </CSSTransition>
            <i className={navSearchIconClass}>&#xe60b;</i>
            {this.getListArea()}
          </NavSearchWrapper>
          {/* /搜索框 */}
        </Nav>
        {/* 附加按钮 */}
        <Addition>
          <Button>
            <i className="iconfont">&#xe615;</i>
            写文章
          </Button>
          <Button hollow>注册</Button>
        </Addition>
        {/* /附加按钮 */}
      </HeaderWrapper>
    )
  }
}

const mapStateToProps = state => {
  /**
   * 这里的 state 是全局的 state，我们需要使用的是 state 下 header 中的数据
   */
  const headerState = state.get('header')
  return {
    focused: headerState.get('focused'),
    mouseIn: headerState.get('mouseIn'),
    list: headerState.get('list'),
    pageSize: headerState.get('pageSize'),
    page: headerState.get('page'),
    totalPage: headerState.get('totalPage')
  }
}

const mapDispatchToProps = dispatch => {
  return {
    dispatch,
    handleInputFocus(isFirst, e) {
      // 第一次聚焦搜索框时请求搜索推荐数据
      if (isFirst) {
        dispatch(actionCreators.getList())
      }
      dispatch(actionCreators.searchFocus())
    },
    handleInputBlur(e) {
      dispatch(actionCreators.searchBlur())
    },
    handleMouseEnter(e) {
      dispatch(actionCreators.mouseEnter())
    },
    handleMouseLeave(e) {
      dispatch(actionCreators.mouseLeave())
    },
    handleChangePage(page, totalPage, spin, e) {
      const nextPage = page < totalPage ? page + 1 : 1
      dispatch(actionCreators.changePage({ nextPage }))

      let originAngle = parseInt(spin.style.transform.replace(/[^\d]/gi, '')) || 0

      spin.style.transform = `rotate(${originAngle + 360}deg)`
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Header)
