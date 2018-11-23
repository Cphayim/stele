/**
 * 请写出输出值，并解释为什么
 * alert(a);
 * yideng();
 * var flag = true;
 * if (!flag) {
 *   var a = 1;
 * }
 * if (flag) {
 *   function yideng() {
 *     console.log('yideng1');
 *   }
 * } else {
 *   function yideng() {
 *     console.log('yideng2');
 *   }
 * }
 */

// 当前作用域的变量声明提前
var flag;
var a;
var yideng;

alert(a); // 弹出 undefined
yideng();
// 在现代浏览器上: TypeError: yideng is not a function
// 在 IE 上: yideng2

flag = true;

if (!flag) {
  a = 1;
}
if (flag) {
  /**
   * 现代浏览器中在条件块中声明的函数不会直接被提升到当前函数作用域顶部
   * 但是词法中使用到的标识符会被预先声明到作用域中
   */
  /**
   * 在早期浏览器（如 IE），条件块中的函数声明会被提前到当前函数作用域顶部
   * if 和 else 中的 yideng 函数都被提升到了顶部，后者覆盖前者
   */
  function yideng() {
    console.log('yideng1');
  }
} else {
  function yideng(){
    console.log('yideng2')
  }
}
