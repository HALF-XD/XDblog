#### JS 的知识点自查

- [bit 和 byte 分清楚了?](https://www.cnblogs.com/yueshangzuo/p/5889910.html)
- 跨平台开发框架？ 是啥？

```markdown
(++a --a b++ b--)
bit 与 byte
promise 链式调用
原生 js 模块化 在外部文件调用函数返回结果
模块化 JS 文件
Carousel 旋转木马 轮播图
图片懒加载和预加载
三次握手四次挥手
前端性能优化
函数防抖-节流
定时器动画 requestAnimationFrame
强缓存+协商缓存

变量提升
JS 垃圾回收机制
EventLoop 事件循环
Promise 回调地狱
for…in…与 for…of…的分辨
display:none 和 visibility:hidden 两者的区别
内置可迭代对象：Array/String/Map/set/TypedArray
对象的访问器属性
ES5 新增的 Array.prototype.forEach()
JS 中数组的迭代方法：forEach/map/filter/reduce/every/some

怎么实现 new 这个方法，说一下
继承的方式有哪些
原型链是如何继承的
正则表达式中（）{} 【】 \* . 的作用是什么
给定一个手机号，前三位和后三位固定，正则表达式怎么写，怎么对中间四位进行替换操作

浏览器存储
cookie，localStorage，sessionStorage 是什么，有什么区别
Cookie 如何不设置过期时间，会怎么判断
Cookie 有个设置可以让客户端不能更改，你知道这个属性是什么么
前端需要存超过 5MB 的数据，如何实现
sessionStorage 页面刷新会丢失么

React 钩子 hooks 用过哪些，平时开发遇到过哪些问题，及解决办法
React 上优化性能的方式，平时用过哪些
useCallback 和 useMemo 的区别，什么场景会用到
memo 的作用是什么，什么场景会用到
设计模式说一下，了解哪些，让你实现一个发布订阅，你会怎么实现

http 状态码 204、301、302、304、401、403 的意思
说一下跨域的方法有哪些
```

```
- 引用类型、基本类型
- var、let、const区别


- 原生js>html5 新增 `classList`
  - 有方法 `add() remove() contains() toggle() replace()`
- 原生js有哪些缺点
- "~"运算符的推导过程
- 负数的二进制表示

- this指向问题
- 数组扁平化，怎么实现的？解决了什么问题？
- 经典面试题：「请说出在淘宝网输入一个关键词到最终展示网页的整个流程，越详细越好」
- JS模块化原理 依赖于闭包实现
- JS数组中的迭代方法 `forEach/map/filter/reduce/every/some`
- 原型链 `prototype`和 `__proto__`
- new的原理与实现->原型、原型链
- JS New一个对象的过程

- 事件捕获和事件冒泡
- DOM 0级事件和DOM 2级事件

- `[].concat[1] // undefined`
- `sort()`方法
- `0.1+0.2` 的结果
- `['1','2','3'].map(parseInt)`的结果
```

html 面试题 https://segmentfault.com/a/1190000014994737

手写 bind/apply/call： https://www.bilibili.com/video/BV1434y1X7Mv

#### 图片流量问题

​- 未压缩的 jpg;

- 压缩过品质的 JPG，节省流量;
- webp 节省流量;
- 添加 IEwebp 兼容性检测代码，解决部分客户看不见图片的问题;

#### 数组随手记录

JavaScript 中的数组：

​ 是一种特殊的对象，效率上不如其他语言中的数组高。

​ 表示偏移量的索引是其中一个属性，因为 JavaScript 对象中的属性名必须是字符串。

##### for...in 的坑

https://www.zhihu.com/question/548151114
https://www.zhihu.com/question/385711203
for...in 遍历数组不推荐，typescript-eslint 有个 no-for-in-array 规则来禁用这种用法。一般遍历对象也不推荐。一般情况下，禁用。
for...in 一般是用于遍历对象的 key 用的，JS 的数组在根源上是一个对象，所以 for...in 对数组有效，对象本身的 key 都是字符串，所以 for in 在循环得出的那个 key 就是字符串，字符串和数字相加会产生隐式转换。

##### 数组遍历问题

遍历的话推荐用: old-school 的 for 循环，数组的 forEach 方法，for-of: for(let [index] of arr.entries()) {} / for (let index of arr.keys())。
for in 用来遍历对象的所有可迭代属性，键必定是字符串，数组也是一种对象，它的 n 个元素对应 n 个索引，它们都是可迭代属性。for of 和 forEach 用来遍历数组的元素，需要中途 break 就用 for of，需要所有元素遍历一遍就用 forEach，需要挨个遍历并返回一个值构成等长的新数组就用 map。

##### 常用数组

常用方法

```
push / pop / shift / unshift
indexOf / find
splice / slice
forEach
every / some
map / filter / reduce
```

简单对应场合

```
foreach	单纯地遍历，把所有元素都过一遍（比如，控制台打印所有元素)
every 检测数组中是否所有元素符合条件
some 检测数组中是否有元素符合条件
find	从列表中找出符合条件的一个元素（比如，从用户数组中找第一个符合条件的用户）
map	将一个列表转换成另一个等长的列表（比如，给所有字符串末尾加一个逗号）
filter	从列表中找出符合条件的若干元素（比如，从用户数组中过滤掉非管理员用户）
reduce	将一个列表合并成一个值（比如，对整数数组求和）
flat
flatMap	map和flat的结合，适合用来将一个列表转换成另一个不等长的列表
```

简单例子

```js
// 数组遍历检查
Object.keys(proposal).length > 0;
// 获取数组最后一个元素，不改变原数组
arr.slice(-1)[0]; // slice方法生成一个新的数组
```

##### 重要方法的参数

JS 数组方法有默认的参数，如果使用不当容易踩坑。比如遇到的面试题：`[1,2,3].parseInt()`

```js
fruits.forEach(function (item, index, array) {
  console.log(item, index);
});
```

#### Promise

取消一个正在执行的 Promise

情况：希望确认数为 1 的时候，就执行逻辑，然后 return

但后续会继续打印 log 确认数 1 2 3 4 5

#### ES6

##### await 为什么建议用 `try...catch` 捕获错误

```js
const response = await ajax("/xxx").catch(handleError);
// handleError 里 reject 或 throw
```

##### async/await

`async/await` 的主要目的是用同步的写法实现异步功能。
因此使用`try...catch...`做异常捕获是符合同步编程思维的。

其实在 `Promise` 内部执行过程中一直有 `try...catch` 包裹，最终封装成链式 `catch` 的写法。
在简单场景下，`async/await` 和 `Promise` 的差别不大，选择哪种写法取决于开发者对同步写法和链式写法的习惯和喜好。

总结观点：

- `async/await` 的作用是提供了异步编程的同步写法;
- 简单场景下，`promise` 和 `async/await` 做错误处理差别不大，不用太纠结;
- 如何设计异常处理的时机可能是更值得关注的点;
- 异步顺序调用的场景，正是 `async/await` 的用武之地，可以避免连续嵌套.
