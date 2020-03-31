// 函数节流
const throttle = (func, wait = 50) => {
  // 最后一次执行时间
  let lastTime = 0
  return function(...args) {
    now = Date.now()
    // 如果当前时间与最后一次执行时间的间隔大于等待时间才执行
    if (now - lastTime > wait) {
      lastTime = now
      func.apply(this, ...args)
    }
  }
}

// 函数防抖
const debounce = (func, wait = 50) => {
  // 缓存一个定时器id
  let timer = 0
  return function(...args) {
    // 清除上一个定时器
    if (timer) {
      clearTimeout(timer)
      timer = 0
    }
    // 设置一个新的定时器来延迟执行函数
    timer = setTimeout(() => {
      func.apply(this, args)
    }, wait)
  }
}
