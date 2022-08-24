#### JS的知识点自查


- [bit 和 byte 分清楚了?](https://www.cnblogs.com/yueshangzuo/p/5889910.html)
- 跨平台开发框架？ 是啥？

```markdown
(++a --a b++ b--)
bit与byte
promise链式调用
原生js 模块化 在外部文件调用函数返回结果
模块化JS文件
Carousel  旋转木马 轮播图
图片懒加载和预加载
三次握手四次挥手
前端性能优化
函数防抖-节流
定时器动画requestAnimationFrame
强缓存+协商缓存
浏览器存储
变量提升
JS垃圾回收机制
EventLoop事件循环
Promise回调地狱
for…in…与for…of…的分辨
display:none和visibility:hidden两者的区别
内置可迭代对象：Array/String/Map/set/TypedArray
对象的访问器属性
ES5新增的Array.prototype.forEach()
JS中数组的迭代方法：forEach/map/filter/reduce/every/some
http状态码204、301、302、304、401、403的意思
怎么实现new这个方法，说一下
继承的方式有哪些
原型链是如何继承的
正则表达式中（）{} 【】 *  . 的作用是什么
给定一个手机号，前三位和后三位固定，正则表达式怎么写，怎么对中间四位进行替换操作
cookie，localStorage，sessionStorage是什么，有什么区别
Cookie如何不设置过期时间，会怎么判断
Cookie有个设置可以让客户端不能更改，你知道这个属性是什么么
说一下跨域的方法有哪些
前端需要存超过5MB的数据，如何实现
sessionStorage页面刷新会丢失么
React钩子hooks用过哪些，平时开发遇到过哪些问题，及解决办法
React上优化性能的方式，平时用过哪些
useCallback和useMemo的区别，什么场景会用到
memo的作用是什么，什么场景会用到
设计模式说一下，了解哪些，让你实现一个发布订阅，你会怎么实现
```

html面试题 https://segmentfault.com/a/1190000014994737

手写bind/apply/call： https://www.bilibili.com/video/BV1434y1X7Mv

#### 图片流量问题

​	[1] 未压缩的jpg.

​	[2] 压缩过品质的JPG，节省流量

​	[3] webp，节省流量

​	[4] 添加IEwebp兼容性检测代码，解决部分客户看不见图片的问题

#### 数组随手记录

JavaScript中的数组：

​	是一种特殊的对象，效率上不如其他语言中的数组高。

​	表示偏移量的索引是其中一个属性，因为JavaScript对象中的属性名必须是字符串。

##### for...in的坑

https://www.zhihu.com/question/548151114
https://www.zhihu.com/question/385711203
for...in 遍历数组不推荐，typescript-eslint 有个 no-for-in-array 规则来禁用这种用法。一般遍历对象也不推荐。一般情况下，禁用。
for...in 一般是用于遍历对象的key用的，JS的数组在根源上是一个对象，所以for...in对数组有效，对象本身的key都是字符串，所以for in 在循环得出的那个key就是字符串，字符串和数字相加会产生隐式转换。

##### 数组遍历问题

遍历的话推荐用: old-school 的 for 循环，数组的 forEach 方法，for-of: for(let [index] of arr.entries()) {} / for (let index of arr.keys())。
for in用来遍历对象的所有可迭代属性，键必定是字符串，数组也是一种对象，它的n个元素对应n个索引，它们都是可迭代属性。for of和forEach用来遍历数组的元素，需要中途break就用for of，需要所有元素遍历一遍就用forEach，需要挨个遍历并返回一个值构成等长的新数组就用map。

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
Object.keys(proposal).length > 0
// 获取数组最后一个元素，不改变原数组
arr.slice(-1)[0] // slice方法生成一个新的数组
```



##### 重要方法的参数

JS数组方法有默认的参数，如果使用不当容易踩坑。比如遇到的面试题：`[1,2,3].parseInt()`

```js
fruits.forEach(function(item, index, array) {
	console.log(item, index)
})
```



#### Promise 

取消一个正在执行的Promise

情况：希望确认数为1的时候，就执行逻辑，然后return 

但后续会继续打印log 确认数1 2 3 4 5