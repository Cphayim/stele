/**
 * 写出输出值，并解释为什么
 */
Object.prototype.a = 'a';
Function.prototype.a = 'a1';
function Person() {}
var yideng = new Person(); // 创建了一个 Person 对象 {}
// yideng.__proto__.__proto__.a === Person.prototype.__proto__.a  === Object.prototype.a
console.log('p.a: ' + yideng.a); // a
// Number(1.).__proto__.__proto__.a === Object.prototype.a
console.log(1..a); // a
console.log(1.a); // SyntaxError: Invalid or unexpected token
