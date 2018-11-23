/**
 * 请写出如下输出值，并写出把注释掉的代码取消注释的值，并解释为什么
 * this.a = 20;
 * var test = {
 *   a: 40,
 *   init: () => {
 *     console.log(this.a);
 *     function go() {
 *       // this.a = 60;
 *       console.log(this.a);
 *     }
 *     go.prototype.a = 50;
 *     return go;
 *   }
 * };
 * // var p = test.init()
 * // p();
 * new (test.init())();
 */

/**
 * 1.去掉注释前
 */
// 变量声明提前
var test;

this.a = 20; // window.a = 20;
test = {
  a: 40,
  init: () => {
    // 函数声明提前
    function go() {
      console.log(this.a);
    }
    console.log(this.a);
    go.prototype.a = 50;
    return go;
  }
};
new (test.init())();
/**
 * test.init 方法指向一个箭头函数
 * 调用时未绑定上下文（this），RHS 引用时根据词法作用域找到外层 this，即 window
 * 输出 window.a => 20
 * 返回 go 函数
 *
 * new(go)()
 * 通过 new 关键字调用 go 函数，此时 this 指向新的实例对象 {}，this.a 在原型上找到
 * 输出 {}.__proto__.a => 50
 */

/**
 * 2.去掉注释后
 */
// 变量声明提前
var test;
var p;

this.a = 20; // window.a = 20;
test = {
  a: 40,
  init: () => {
    // 函数声明提前
    function go() {
      this.a = 60;
      console.log(this.a);
    }
    console.log(this.a);
    go.prototype.a = 50;
    return go;
  }
};
p = test.init();
/**
 * 同上 输出 window.a => 20
 * 返回 go 构造函数
 */
p();
/**
 * 直接调用 go 函数，此时 this 指向 window
 * this.a = 60; // window.a = 60; 修改了全局的值
 * 输出 window.a => 60
 */
new (test.init())();
/**
 * test.init() 同上
 * 输出 window.a => 60
 * 返回 go 构造函数
 *
 * 通过 new 关键字 调用 go 函数，this 指向新创建的实例对象 { a: 60}
 * 输出 { a: 60 }.a => 60
 */
