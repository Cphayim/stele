// 首先处理运行时错误
window.onerror = (message, source, lineno, colno, error) => {
  console.log(`捕获到错误(window.error): `)
  console.log({ message, source, lineno, colno, error })
  // 返回 true 表示已经成功处理错误（不会出现 Uncaught error）
  return true
}

// 当一项资源（如图片或脚本）加载失败，
// 加载资源的元素会触发一个 Event 接口的 error 事件
// 并执行该元素上的onerror() 处理函数
// 这些 error 事件不会向上冒泡到 window ，不过（至少在 Firefox 中）能被单一的window.addEventListener 捕获
window.addEventListener(
  'error',
  error => {
    console.log('捕获到错误(event.error):')
    console.log(error)
    return true
  },
  true
)

// 处理未处理 Promise.reject
window.addEventListener('unhandledrejection', e => {
  e.preventDefault()
  console.log('捕获到错误(未处理的 Promise.reject):')
  console.log(e)
  return true
})

setTimeout(() => {
  throw Error('B')
}, 100)

new Promise((resolve, reject) => {
  reject(123)
})
