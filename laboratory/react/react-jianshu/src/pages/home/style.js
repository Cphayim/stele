/*
 * @Author: Cphayim
 * @Date: 2019-01-25 15:08:14
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 19:03:09
 * @Description:
 */
import styled from 'styled-components'

export const HomeWrapper = styled.div`
  overflow: hidden;
  width: 960px;
  margin: 0 auto;
`

export const HomeLeft = styled.div`
  float: left;
  width: 625px;
  padding-top: 30px;
  margin-left: 15px;

  .banner-img {
    width: 625px;
    height: 270px;
  }
`

export const HomeRight = styled.div`
  width: 280px;
  float: right;
`

export const TopicWrapper = styled.div`
  overflow: hidden;
  padding: 20px 0 10px 0;
  margin-left: -18px;
`

export const TopicItem = styled.div`
  float: left;
  height: 34px;
  padding-right: 10px;
  margin-left: 18px;
  margin-bottom: 18px;
  border-radius: 4px;
  line-height: 32px;
  font-size: 14px;
  border: 1px solid #dcdcdc;
  background: #f7f7f7;

  .topic-pic {
    float: left;
    display: block;
    width: 32px;
    height: 32px;
    margin-right: 10px;
  }
`

export const ListItem = styled.div`
  overflow: hidden;
  padding: 20px 0;
  border-top: 1px solid #dcdcdc;
  &:last-child {
    border-bottom: 1px solid #dcdcdc;
  }
  .pic {
    float: right;
    /* display: block; */
    width: 125px;
    height: 100px;
    border-radius: 10px;
  }
`

export const ListInfo = styled.div`
  width: 500px;
  float: left;
  padding-right: 15px;
  .title {
    margin-top: 0;
    line-height: 27px;
    font-size: 18px;
    font-weight: bold;
    color: #333;
  }
  .desc {
    font-size: 13px;
    line-height: 18px;
    color: #999;
  }
`

export const RecommendWarpper = styled.div`
  margin: 30px 0;
  width: 280px;
`

export const RecommendItem = styled.div`
  width: 280px;
  height: 50px;
  border-radius: 4px;
  margin-bottom: 6px;
  background: url(${pros => pros.imgUrl});
`

export const LoadMore = styled.div`
  width: 100%;
  height: 40px;
  border-radius: 20px;
  margin: 30px 0;
  line-height: 40px;
  text-align: center;
  background: #a5a5a5;
  color: #fff;
  cursor: pointer;
`
