/*
 * @Author: Cphayim
 * @Date: 1985-10-26 16:15:00
 * @LastEditors: Cphayim
 * @LastEditTime: 2019-01-23 03:24:05
 * @Description: 全局样式文件
 */
import React, { Fragment } from 'react'
import { createGlobalStyle } from 'styled-components'

import IconFont from './assets/iconfont/iconfont'

const CommonStyle = createGlobalStyle`
  * {
    box-sizing: border-box;
  }

  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
      "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
      sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  code {
    font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
      monospace;
  }
`

export default function GlobalStyle() {
  return (
    <Fragment>
      <CommonStyle />
      <IconFont />
    </Fragment>
  )
}
