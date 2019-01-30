/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:04:22
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-30 17:24:08
 * @Description:
 */
import React, { Component } from 'react'
import { connect } from 'react-redux'

import { actionCreators } from './store'
import { DetailWrapper, Header, Content } from './style'

class Detail extends Component {
  render() {
    const { title, content } = this.props
    return (
      <DetailWrapper>
        <Header>{title}</Header>
        <Content dangerouslySetInnerHTML={{ __html: content }} />
      </DetailWrapper>
    )
  }

  componentDidMount() {
    console.log(this.props)
    const { id } = this.props.match.params
    this.props.getDetail(id)
  }
}

const mapState = state => ({
  title: state.getIn(['detail', 'title']),
  content: state.getIn(['detail', 'content'])
})

const mapDispatch = dispatch => ({
  getDetail(id) {
    dispatch(actionCreators.getDetail(id))
  }
})

export default connect(
  mapState,
  mapDispatch
)(Detail)
