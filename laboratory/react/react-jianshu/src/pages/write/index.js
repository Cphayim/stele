/*
 * @Author: Cphayim
 * @Date: 2019-01-31 23:41:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 01:05:41
 * @Description:
 */
import React, { Component } from 'react'
import { Redirect } from 'react-router-dom'
import { connect } from 'react-redux'

class Write extends Component {
  render() {
    const { logined } = this.props

    if(!logined) {
      return <Redirect to="/login"></Redirect>
    }

    return <div>写文章页面</div>
  }
}

const mapStateToProps = state => ({
  logined: state.getIn(['login', 'logined'])
})

const mapDispatchToProps = dispatch => ({})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Write)
