// 请问点击<buttion id=“test”></button>会有反应么?为什么?能解决么?(5分)

$('#test').click(function(argument) {
  console.log(1);
});
setTimeout(function() {
  console.log(2);
}, 0);
while (true) {
  console.log(Math.random());
}
/**
 * 没有反应，主线程的同步任务一直没有执行完毕，不会处理异步队列中的任务
 * 可以用 Worker 创建一个新的线程来处理循环任务
 */
