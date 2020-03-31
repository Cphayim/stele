/*
 * @Author: Cphayim
 * @Date: 2019-01-31 23:41:49
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-02-01 00:46:00
 * @Description:
 */
import React, { Component } from 'react'
import { Redirect } from 'react-router-dom'
import { connect } from 'react-redux'
import { LoginWrapper, LoginBox, Input, Button } from './style'
import { actionCreators } from './store'

class Login extends Component {
  render() {
    const { logined } = this.props

    // 如果已经登录，跳转到首页
    if (logined) {
      return <Redirect to="/" />
    }

    return (
      <LoginWrapper>
        <LoginBox>
          <Input placeholder="账号" ref={input => (this.account = input)} />
          <Input placeholder="密码" type="password" ref={input => (this.password = input)} />
          <Button onClick={e => this.props.login(this.account, this.password, e)}>登录</Button>
        </LoginBox>
      </LoginWrapper>
    )
  }
}

const mapStateToProps = state => ({
  logined: state.getIn(['login', 'logined'])
})

const mapDispatchToProps = dispatch => ({
  login(accountEle, passwordEle) {
    dispatch(actionCreators.login(accountEle.value, passwordEle.value))
  }
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Login)
