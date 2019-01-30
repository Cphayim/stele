/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:22:17
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-30 17:23:06
 * @Description:
 */
import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { connect } from 'react-redux'

import { actionCreators } from '../store'
import { ListItem, ListInfo, LoadMore } from '../style'

class List extends Component {
  render() {
    const { list, getMoreList } = this.props
    const lastId = list.size ? list.get(list.size - 1).get('id') : 0
    return (
      <div>
        {list.map(item => (
          <Link to={'/detail/' + item.get('id') + '?id=' + item.get('id')} key={item.get('id')}>
            <ListItem>
              <img className="pic" src={item.get('imgUrl')} alt={item.get('title')} />
              <ListInfo>
                <h3 className="title">{item.get('title')}</h3>
                <p className="desc">{item.get('desc')}</p>
              </ListInfo>
            </ListItem>
          </Link>
        ))}
        <LoadMore onClick={e => getMoreList(lastId)}>更多文字</LoadMore>
      </div>
    )
  }
}

const mapState = state => ({
  list: state.getIn(['home', 'articleList'])
})

const mapDispatch = dispatch => ({
  dispatch,
  getMoreList(cursor) {
    dispatch(actionCreators.getMoreList(cursor))
  }
})

export default connect(
  mapState,
  mapDispatch
)(List)
