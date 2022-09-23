[《TypeScript Deep Dive》](https://github.com/basarat/typescript-book/) 的中文翻译版 https://jkchao.github.io/typescript-book-chinese/

#### TypeScript 笔记

```
TypeScript全面解析 - 方应航
视频 https://www.bilibili.com/video/BV1ig411k7pf
课程大纲：
运行与调试 类型声明 类型操作 类型编程
函数 对象 泛型 工具类型
导入导出
命名空间 类型兼容 类型体操 JSX类型
...
```

#### content 1

- 什么是类型擦除？

- 如何将 TS 转为 JS？

- 如何直接运行 TS？

- 如何调试 TS？

TS 类型体操（函数式编程）：https://github.com/type-challenges/type-challenges

函数式编程：默认偏好，一个变量声明了之后就不能再更改了

拥抱 TS 和函数，摒弃 any script 和 class

##### 怎么编译运行 TS 代码？

TS 放在 deno 里可以直接运行；

TS 转为 JS，类型擦除，再执行；

esbuild（go） / swc（rust） 快，不检查语法;

tsc / babel

```
[TypeScript] ---运行--> Deno
类型擦除
[ES6]  -----> Node.js 12+ Chrome
转译
[ES5]  -----> Node.js 10- IE11-
打包
[单文件] -----> Node.js 12+ Chrome
下载
[浏览器]
```

##### 在线编辑预览 TS

```
playcode.io 速度快
stackblitz.com 功能功能很全 有Vite
codesandbox.io 慢 没有Vite
本地 Vitejs.dev
```

##### 调试 TS？

vscode 里会有警告，或者控制台。

#### 推荐书籍：

《编程与类型系统》

《类型和程序设计语言》缩写 TAPL --- 很难

《TypeScript 编程》又名《Programming TypeScript》

#### content 2

##### TS 的数据类型 DataType

JS 的：`null / undefined / string / number / boolean / bigint / symbol / Object(Array/Function/Data...)`

TS 的：`（JS所有）/ void / never / enum / unknow / any / type / interface`

JS 有包装对象的操作

比如 `Number / String / Boolean` 只用于包装对象，正常开发者不用它们，在 TS 里也不用

```JS
let n = 42;
(42).toFixed(12)
let temp = new Number(42)
value = temp.toFixed(2)
// 最后删除temp
```

TS 不用 Object，范围太大了

```ts
empty = {};
a = { math: 42, lan: 99 };
b = { Fang: "Frank", Ma: "Jack" };
c = { 1: 26, 2: 42, 3: 44 };
arr = [6, "frank", true, 1.1];
f1 = () => 1;
f2 = function () {
  console.log(this.name);
};
f3 = (a, b) => a + b;
date1 = new Date();
r1 = /ab+c/;
r2 = new RegExp("ab+c");
```

##### 如何在 TS 里描述对象的数据类型？

（1）用 `class/construcot` 描述

（2）用 `type/interface` 描述（推荐）

【TS 开发者一般使用 索引签名 或 Record 泛型 来描述普通对象 】

```ts
type A = {
  // 索引签名
  [k: number]: string; // key的类型为String number symbol(用得非常少)
};
type A2 = Record<string, number>; // Record泛型
// A和A2想表达的含义一模一样

const a: A = {};
```

##### 如何描述数组对象？

由于 Array 不太精确，所以一般用 `Array<string>` 或 `string[]` 或 ` [string, string]` 来描述数组

```ts
type A = string[];
const a: A = ["h", "i"];
// 等价于
type A = Array<string>; //泛型

type D = [string, string, string]; // 元组
const d: D = ["h", "i", "i"];
```

##### 如何描述函数对象？

```ts
type FnA = {a:number, b:number} => number
type FnB = {x:number, y:number} => string

type FnReturnVoid - {s:string} => void  // 没有返回值，则写void
type FnReturnUndefined - {s:string} => undefined

const v:FnReturnVoid = {s:string} => {
  console.log(s)
}

const v:FnReturnUndefined = {s:string} => {
  console.log(s)
  return undefined
}
```
