/*
 * @Author: Cphayim
 * @Date: 2019-01-25 23:33:43
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 23:54:54
 * @Description:
 */
import React, { Component } from 'react'
import styled from 'styled-components'

export default class BackTop extends Component {
  constructor(props) {
    super(props)

    this.state = {
      show: false
    }
  }

  componentDidMount() {
    this.handleChangeShow()
    this.bindEvent()
  }

  componentWillUnmount() {
    this.unbindEvent()
  }

  bindEvent() {
    window.addEventListener('scroll', this.handleChangeShow)
  }

  unbindEvent() {
    window.removeEventListener('scroll', this.handleChangeShow)
  }

  handleChangeShow = e => {
    const show = document.documentElement.scrollTop > window.innerHeight
    this.setState({ show })
  }

  handleScrollToTop = e => {
    window.scrollTo(0, 0)
  }
  render() {
    return this.state.show && <Wrap onClick={this.handleScrollToTop}>回到顶部</Wrap>
  }
}

const Wrap = styled.div`
  position: fixed;
  right: 50px;
  bottom: 50px;
  width: 60px;
  height: 60px;
  line-height: 60px;
  border: 1px solid #ccc;
  box-sizing: content-box;
  text-align: center;
  font-size: 12px;
`
