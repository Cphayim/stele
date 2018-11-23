const timeout = ms =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
const ajax1 = () =>
  timeout(2000).then(() => {
    console.log('1');
    return 1;
  });
const ajax2 = () =>
  timeout(1000).then(() => {
    console.log('2');
    return 2;
  });
const ajax3 = () =>
  timeout(2000).then(() => {
    console.log('3');
    return 3;
  });
const mergePromise = ajaxArray => {
  // 1,2,3 done [1,2,3]
  // 代码书写处
  // return Promise.all(ajaxArray.map(ajax => ajax())); // 2 1 3 done [1,2,3]
  /**
   * 要保证输出顺序
   */
  async function aSCExecAjax() {
    const data = [];
    for (let ajax of ajaxArray) {
      data.push(await ajax())
    }
    return data
  }
  return aSCExecAjax();
};
mergePromise([ajax1, ajax2, ajax3]).then(data => {
  console.log('done');
  console.log(data); // data 为 [1,2,3]
});
