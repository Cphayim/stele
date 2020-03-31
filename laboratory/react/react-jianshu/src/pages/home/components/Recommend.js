import React, { Component } from 'react'
import { connect } from 'react-redux'

import { RecommendWarpper, RecommendItem } from '../style'

class Recommend extends Component {
  render() {
    const { list } = this.props
    return (
      <RecommendWarpper>
        {list.map((item, index) => (
          <RecommendItem imgUrl={item} key={index} />
        ))}
      </RecommendWarpper>
    )
  }
}

const mapState = state => ({
  list: state.getIn(['home', 'recommendList'])
})

const mapDispatch = dispatch => ({
  dispatch
})

export default connect(
  mapState,
  mapDispatch
)(Recommend)
