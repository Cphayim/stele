/*
 * @Author: Cphayim
 * @Date: 2019-01-22 17:06:32
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-24 04:22:00
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
  height: ${headerHeight + 1}px; /* 因 box-sizing: border-box 包含了 border */
  margin: auto;
  border-bottom: 1px solid #f0f0f0;
`

export const Logo = styled.a`
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100px;
  height: ${headerHeight}px;
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
  line-height: ${headerHeight}px;
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

  .zoom {
    position: absolute;
    right: 5px;
    bottom: 4px;
    width: 30px;
    line-height: 30px;
    border-radius: 15px;
    text-align: center;
    transition: all 0.2s linear;
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

  &.slide-enter,
  &.slide-appear {
    transition: all 0.2s ease-out;
  }
  &.slide-enter-active,
  &.slide-appear-active {
    width: 240px;
  }
  &.slide-enter-done,
  &.slide-appear-done {
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

export const SearchInfo = styled.div`
  position: absolute;
  left: 0;
  top: ${headerHeight}px;
  width: 280px;
  /* height: 300px; */
  padding: 0 20px;
  background-color: #fff;
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
`

export const SearchInfoTitle = styled.div`
  margin-top: 20px;
  margin-bottom: 15px;
  line-height: 20px;
  font-size: 14px;
  color: #969696;
`

export const SearchInfoSwitch = styled.span`
  float: right;
  font-size: 13px;

  .spin {
    display: inline-block;
    margin: 2px;
    font-size: 12px;
    transform: rotate(0deg);
    transform-origin: center center;
    transition: all 0.5s ease-in-out;
  }
`

export const SearchInfoList = styled.div`
  overflow: hidden;
`

export const SearchInfoItem = styled.a`
  float: left;
  display: block;
  padding: 0 5px;
  border: 1px solid #b4b4b4;
  border-radius: 3px;
  margin-right: 10px;
  margin-bottom: 15px;
  line-height: 20px;
  font-size: 12px;
  color: #787878;
`

export const Addition = styled.div`
  position: absolute;
  right: 0;
  top: 0;
  height: ${headerHeight}px;
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
