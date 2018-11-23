/**
 * 请在下面写出JavaScript面向对象编程的混合式继承。并写出ES6版本的继承。
 * 要求:汽车是父类，Cruze是子类。
 * 父类有颜色、价格属性，有售卖的方法。
 * Cruze子 类实现父类颜色是红色，价格是140000,售卖方法实现输出如下语句:将 红色的Cruze 买给了小王价格是14万。
 */

// ES5
function Car(color, price) {
  this.color = color
  this.price = price
}

Car.prototype.sell = function() {}

function Cruze() {
  Car.call(this, '红色', 140000)
}

Cruze.prototype = Object.create(Car.prototype)
Cruze.prototype.constructor = Cruze
Cruze.prototype.sell = function() {
  console.log('将 红色的Cruze 买给了小王价格是14万')
}

// ES6
class Car {
  constructor(color, price) {
    this.color = color
    this.price = price
  }
  sell() {}
}

class Cruze {
  constructor(color, price) {
    super(color, price)
  }
  sell() {
    console.log('将 红色的Cruze 买给了小王价格是14万')
  }
}
