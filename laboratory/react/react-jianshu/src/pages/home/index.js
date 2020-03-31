/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:02:58
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 18:49:29
 * @Description:
 */
import React, { Component } from 'react'
import { connect } from 'react-redux'

import { HomeWrapper, HomeLeft, HomeRight } from './style'
import Topic from './components/Topic'
import List from './components/List'
import Recommend from './components/Recommend'
import Writer from './components/Writer'
import * as actionCreators from './store/actionCreators'

class Home extends Component {
  componentDidMount() {
    this.props.getHomeData()
  }
  render() {
    const { bannerImgUrl } = this.props
    return (
      <HomeWrapper>
        <HomeLeft>
          <img className="banner-img" src={bannerImgUrl} alt="" />
          <Topic />
          <List />
        </HomeLeft>
        <HomeRight>
          <Recommend />
          <Writer />
        </HomeRight>
      </HomeWrapper>
    )
  }
}

const mapState = state => ({
  bannerImgUrl: state.getIn(['home', 'bannerImgUrl'])
})

const mapDispatch = dispatch => ({
  dispatch,
  getHomeData() {
    dispatch(actionCreators.getHomeData())
  }
})

export default connect(
  mapState,
  mapDispatch
)(Home)
