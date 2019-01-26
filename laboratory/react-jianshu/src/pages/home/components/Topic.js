/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:22:09
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 16:55:20
 * @Description:
 */
import React, { Component } from 'react'
import { connect } from 'react-redux'

import { TopicWrapper, TopicItem } from '../style'

class Topic extends Component {
  render() {
    const { list } = this.props
    return (
      <TopicWrapper>
        {list.map(item => (
          <TopicItem key={item.get('id')}>
            <img className="topic-pic" src={item.get('imgUrl')} alt={item.get('title')} />
            {item.get('title')}
          </TopicItem>
        ))}
      </TopicWrapper>
    )
  }
}

const mapState = state => ({
  list: state.getIn(['home', 'topicList'])
})

const mapDispatch = null

export default connect(
  mapState,
  mapDispatch
)(Topic)
