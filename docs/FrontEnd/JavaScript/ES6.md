- [ES6 入门教程---阮一峰](https://es6.ruanyifeng.com/)
- [现代 JavaScript 教程](https://zh.javascript.info/)

#### var let const

var、let、const 的区别

|            | var                | let    | const                  |
| ---------- | ------------------ | ------ | ---------------------- |
| 重复定义   | 可以               | 不可以 | 不可以                 |
| 修改值     | 可以               | 可以   | 不可以（引用类型可以） |
| 声明提升   | 会                 | 不会   | 不会                   |
| 块级作用域 | 不支持（函数例外） | 支持   | 支持                   |
| 循环       | 可以               | 可以   | 不可以                 |

const 常量
let 块级作用域，以前都是用函数来实现的。
var 最好就不用了，除非涉及到 闭包，声明提升
循环 也是块级作用域（ES6 之前不算）

```js
var a = ["a", "b", "c", "d"];
var b = [];
var c = [1000, 200, 1300, 400];

for (var i = 0; i < a.length; i++) {
  var t = a[i];
  b.push(
    new Promise((resolve, reject) => {
      setTimeout(() => {
        console.log(t, i);
        resolve();
      }, c[i]);
    })
  );
}

Promise.all(b).then(() => {
  console.log("all");
});
```

var 没有块级作用域 - for/ if
闭包可以解决问题，函数是一个作用域
=> 三种方案对比 es5 - 闭包 - es6 let

```js
const btns = document.querySelectorAll("button");

// var
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function () {
    console.log(i);
  });
}

// es5中使用闭包
for (var i = 0; i < btns.length; i++) {
  (function (num) {
    btns[num].addEventListener("click", function () {
      console.log(num);
    });
  })(i);
}

// es6-let
for (let i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function () {
    console.log(i);
  });
}
```

####
