/*
  实现 machine 函数

  function machine() {

  }
  machine('abc').execute()
  // start abc
  machine('abc').do('eat').execute()
  // start abc
  // abc eat
  machine('abc).wait(5).do('eat').execute()
  // start abc
  // wait 5 （等待5秒）
  // abc eat
  machine('abc).waitFirst(5).do('eat').execute()
  // wait 5
  // start abc
  // abc eat
*/
/*function machine(name) {
  return new class {
    constructor(name) {
      this.name = name
      this.taskQueue = [
        next => {
          console.log(`start ${this.name}`)
          next()
        }
      ]
    }
    do(action) {
      this.taskQueue.push(next => {
        console.log(`${name} ${action}`)
        next()
      })
      return this
    }
    wait(second) {
      this.taskQueue.push(next => {
        console.log(`wait ${second}s`)
        setTimeout(() => {
          next()
        }, second * 1000)
      })
      return this
    }
    waitFirst(second) {
      this.taskQueue.unshift(next => {
        console.log(`wait ${second}s`)
        setTimeout(() => {
          next()
        }, second * 1000)
      })
      return this
    }
    execute() {
      this.taskQueue.reduceRight((a, b) => b.bind(this, a), () => {})()
    }
  }(name)
} */

// Promise 实现方式
function machine(name) {
  return new class {
    constructor(name) {
      this.name = name
      this.taskQueue = [() => console.log(`start ${this.name}`)]
    }
    do(action) {
      this.taskQueue.push(() => console.log(`${this.name} ${action}`))
      return this
    }
    wait(second) {
      const callback = () =>
        new Promise(resolve => {
          console.log(`wait ${second}s`)
          setTimeout(resolve, second * 1000)
        })
      callback.isAsync = true
      this.taskQueue.push(callback)
      return this
    }
    waitFirst(second) {
      const callback = () =>
        new Promise(resolve => {
          console.log(`wait ${second}s`)
          setTimeout(resolve, second * 1000)
        })
      callback.isAsync = true
      this.taskQueue.unshift(callback)
      return this
    }
    execute() {
      const { taskQueue } = this
      this.taskQueue = [() => console.log(`start ${this.name}`)]
      ;(async () => {
        for (let task of taskQueue) {
          if (task.isAsync) {
            await task()
          } else {
            task()
          }
        }
      })()
    }
  }(name)
}

/* function machine(name) {
  return new Action(name)
}
const defer = (time, callback) => {
  return new Promise((resolve) => {
      setTimeout(() => {
          resolve(callback())
      }, time * 1000)
  })
}
class QueueItem {
  constructor(defer, callback) {
      this.defer = defer;
      this.callback = callback;
  }
}
class Action {
  constructor(name) {
      this.name = name;
      this.queue = []
      this.queue.push(new QueueItem(0, () => console.log(`start ${this.name}`)))
  }
  do(eat) {
      this.queue.push(new QueueItem(0, () => console.log(`${this.name} ${eat}`)))
      return this;
  }
  wait(time) {
      this.queue.push(new QueueItem(time, () => console.log(`wait ${time}s`)))
      return this;
  }
  waitFirst(time) {
      this.queue.unshift(new QueueItem(time, () => console.log(`wait ${time}s`)))
      return this;
  }
  async execute() {
      while(this.queue.length > 0) {
          const curItem = this.queue.shift();
          if (!curItem.defer) {
              curItem.callback();
              continue;
          }
          await defer(curItem.defer, curItem.callback)
      }
  }
} */

// machine('cphayim').execute()

// machine('cphayim')
//   .do('eat')
//   .execute()

// machine('cphayim')
//   .wait(5)
//   .do('eat')
//   .execute()

machine('cphayim')
  .do('eat')
  .wait(3)
  .do('die')
  .execute()

console.log('end')
