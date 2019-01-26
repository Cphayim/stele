/*
 * @Author: Cphayim
 * @Date: 2019-01-23 21:42:30
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-25 23:09:23
 * @Description:
 */
import Mock from 'mockjs'

const basicStruct = {
  code: 0,
  message: 'ok',
  timestamp: Date.now()
}

let articleId = 1

function getArticleList() {
  return Mock.mock({
    'articleList|10': [
      {
        id: () => articleId++,
        title: '@cword(10,15)',
        desc: '@csentence(40,100)',
        imgUrl: `@image(125x100, @color)`
      }
    ]
  })
}

export default () => {
  Mock.mock(/\/headerList.json$/, {
    ...basicStruct,
    'data|30': ['@cword(2,5)']
  })

  Mock.mock(/\/homeData.json$/, {
    ...basicStruct,
    data: {
      bannerImgUrl: `@image(625x270, @color)`,
      'topicList|4-15': [
        {
          'id|+1': 1,
          title: '@cword(3,5)',
          imgUrl: `@image(32x32, @color)`
        }
      ],
      ...getArticleList(),
      'recommendList|5': [`@image(280x50, @color)`]
    }
  })

  Mock.mock(/\/homeList.json(\?.*)?/, {
    ...basicStruct,
    data: () => getArticleList()
  })
}
