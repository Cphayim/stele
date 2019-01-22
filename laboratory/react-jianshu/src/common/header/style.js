/*
 * @Author: Cphayim
 * @Date: 2019-01-22 17:06:32
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:29:42
 * @Description: Header 依赖的样式组件
 */
import styled from 'styled-components'
import logoPic from '../../assets/logo.png'

const headerHeight = 56
const headerWrapperMaxWidth = 1440
const headerWrapperMinWidth = 768

const primaryColor = '#ea6f5a'

export const HeaderWrapper = styled.div`
  position: relative;
  max-width: ${headerWrapperMaxWidth}px;
  min-width: ${headerWrapperMinWidth}px;
  height: ${headerHeight}px;
  margin: auto;
  border-bottom: 1px solid #f0f0f0;
`

export const Logo = styled.a`
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100px;
  height: ${headerHeight - 1}px;
  background: url(${logoPic});
  background-size: contain;
`

export const Nav = styled.div`
  max-width: 960px;
  height: 100%;
  padding-right: 70px;
  margin: 0 auto;
`

export const NavItem = styled.div`
  padding: 0 15px;
  line-height: 56px;
  font-size: 17px;
  color: #333;

  &.left {
    float: left;
  }
  &.right {
    float: right;
    color: #969696;
    font-size: 14px;
  }

  &.active {
    color: ${primaryColor};
  }
`

export const NavSearchWrapper = styled.div`
  position: relative;
  float: left;

  .iconfont {
    position: absolute;
    right: 5px;
    bottom: 4px;
    width: 30px;
    line-height: 30px;
    border-radius: 15px;
    text-align: center;
    transition: all .2s linear;
    &.focused {
      background-color: #777;
      color: #fff;
    }
  }

`

export const NavSearch = styled.input.attrs({
  placeholder: '搜索'
})`
  width: 160px;
  height: 38px;
  padding: 0 40px 0 20px;
  border: none;
  border-radius: 19px;
  margin: 9px 0 0 20px;
  outline: none;
  font-size: 14px;
  color: #666;
  background-color: #eee;
  /* 方案一 */
  /* transition: all .2s linear;
  &:focus {
    width: 240px;
  } */
  &.focused {
    width: 240px;
  }
  &::placeholder {
    color: #999;
  }
  /* 方案二 */

  &.slide-enter, &.slide-appear {
    transition: all 0.2s ease-out;
  }
  &.slide-enter-active,&.slide-appear-active  {
    width: 240px;
  }
  &.slide-enter-done, &.slide-appear-done {
    width: 240px;
  }
  &.slide-exit {
    transition: all 0.2s ease-out;
  }
  &.slide-exit-active {
    /* width: 160px; */
  }
  &.slide-exit-done {
    /* width: 160px; */
  }
`

export const Addition = styled.div`
  position: absolute;
  right: 0;
  top: 0;
  height: 56px;
`

export const Button = styled.div`
  float: right;
  padding: 0 20px;
  border: 1px solid ${primaryColor};
  border-radius: 19px;
  margin-top: 9px;
  margin-right: 20px;
  line-height: 38px;
  font-size: 14px;
  color: ${props => (props.hollow ? primaryColor : '#fff')};
  background-color: ${props => (props.hollow ? '#fff' : primaryColor)};
`

Button.defaultProps = {
  hollow: false
}
