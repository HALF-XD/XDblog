
#### 学习中使用到的工具以及网站：

- [TS官方文档](https://www.typescriptlang.org/docs/)
- [playcode.i](https://playcode.io/972751) 可在线编辑代码
- [bilibili教学视频](https://www.bilibili.com/video/BV1iP411L77W/)
- [《TypeScript Deep Dive》](https://github.com/basarat/typescript-book/) 的中文翻译版 https://jkchao.github.io/typescript-book-chinese/
- [GitHub 类型体操](https://github.com/type-challenges/type-challenges)

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

### content 1

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

### content 2

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
函数对象，该怎么描述？
输入，输出
```ts
type FnA = {a:number, b:number} => number
type FnB = {x:number, y:number} => string

type FnReturnVoid - {s:string} => void  // 没有返回值，则写void
type FnReturnUndefined - {s:string} => undefined

const v:FnReturnVoid = {s:string} => { console.log(s) }
const v:FnReturnUndefined = {s:string} => {
  console.log(s)
  return undefined
}
```


#### 其他对象
日期
正则
Map
Set


#### any 和 unknow, never

- any: 包含所有类型，尽量不要使用。
- unknow: 把值的类型遮盖住了，多用于获取外部数据，不清楚数据类型，可用断言做后续处理。
    ```ts
    const a: unknow = 1;
    const b: (a as number);
    ```
- never 怎么用？ never是用来推断的。

#### enum 类型
enum 枚举本质是int值。
什么时候用enum？什么时候不用enum？ 
- 做映射
    ```ts
    enum A {
        todo=0,
        done,
        archived,
        deleted
    }

    let status:A = 0;
    status = A.todo;
    console.log(status)

    export {}
    ```
- 权限控制、位运算
    ```ts
    enum Permission{
        None = 0,
        Read = 1 << 0,
        Write = 1 << 1,
        Delete = 1 << 2,
        Manage = Read | Write | Delete,
    }

    // const user1:{permission:Permission} = {permission: 0b0101};
    type User = {
        permission:Permission
    }
    const user1:User = {
        permission: 0b0101
    }

    if((user1.permission & Permission.Write) === Permission.Write){
        console.log('Write');
    }
    if((user1.permission & Permission.Manage) === Permission.Manage){
        console.log('Manage');
    }
    ```

#### type 和 interface 类型

- type：类型别名[Type Aliases]，给其他类型取个名字
    可以用声明任何类型，描述任何类型
- 面象对象编程 [OOP:object-oriented programming]
- interface：声明接口 描述对象的属性（declare the shapes of objects）

描述范围：
interface:普通对象 Array Function Data Map Set...
type:（以上所有 interface描述） + undefined string number boolean bigint symbol null

type vs. interface区别：
1. interface只描述对象,type描述所有数据包含基本类型。
2. type只是别名，interfac是类型声明（使用时候无明显区别）
3. type不能重新赋值，interface自动合并。
    对内API尽量用type,防止代码分散；无法确定interface被声明了多少次，
    对外API尽量用interface，方便扩展。
    ```ts
    interface X{ name:string }
    interface X{ age:number }
    const a:X = { name:'Jack', age:18 }
    ```

### content 3

#### 联合类型 union type

```ts
type A = number
type B = string
type C = A | B
const c1:C = 42
const c2:C = '234'

type M = {name: string}
type N = {age: number}
type K = M | N
const k1:K = { name: 'Jack', age:100 }
const k2:K = { name: 'Jack' }
const k3:K = { age: 100 } 
```

#### 类型收窄 Narrowing

如何使用联合类型？
把`typeof` 或者 `instance` `in` 把类型区分开,类型收窄[Narrowing].

局限性：
- `typeof` 不支持对对象类型的区分,普通对象、null、Date、Array结果都是object。
- `instance` 不支持对基本类型的区分，不支持TS独有类型的区分。
- `in` 只适用于部分对象。

```ts
const f = (a:number | string) => {
    if(typeof a === 'number'){
        a.toFixed(2)
    }else if(typeof a === 'string'){
        parseFloat(a).toFixed(2)
    }else{
        throw new Error('Never')
    }
}

type Person = { name:string }
const f = (a:Person | Person[]) => {
    if('name' in a){ a }  // Person
    else { a } // Person[]
}
```

#### 类型谓词/类型判断 is

is 支持所有的TS类型，但写起来比较麻烦。

```ts
type Rect = { height: number; width:number }
type Circle = { center: [number, number]; radius: number }
function isRect(x: Rect | Circle): x is Rect{
    return 'height' in x && 'width' in x 
}
const f1 = (a: Rect | Circle) => {
    if(isRect(a)){ a } // Rect
    else{ a } // Circle
}
```

#### 使用 `a.kind` 区分a的类型

可辨别联合 [Discriminated Unions]
优点：让复杂类型的收窄变成简单类型的对比。
- kind 可以用 type 等词汇替代，没有规定。
- kind的类型是简单类型
- kind的值可区分

```ts
type Circle = { kind: "circle"; radius: number; }
type Square = { kind: "square"; sideLength: number};
type Shape = Circle | Square;

const f1 = (shape: Shape) => {
    if(shape.kind === 'circle'){ shape } // Circle
    else if(shape.kind === 'square'){ shape } // Square
    else{ shape } // never
}
```


#### 思考题

1. any是所有类型(除了never/unknow/any/void)的联合吗？
    不是，联合之后只能用交集的方法。
2. 什么是所有类型(除了never/unknow/any/void)的联合吗？
    unknown。


#### 交叉类型 intersection type

适用于 对象类型

```ts
type T = string & number  // type T = never 

type Lhand = {left: string}
type Rhand = {right: string}
type A = Lhand | Rhand
type B = Lhand & Rhand
const a: A = {} // 不能将类型“{}”分配给类型“A”。
const a1: A = { left: 'yes' }
const a2: A = { right: 'yes' }
const a3: A = { left: 'yes', right: 'no'}
const b1: B = { left: 'yes' } //  不能将类型“{ left: string; }”分配给类型“B”。
const b2: B = { left: 'yes', right: 'no'} 
```

模拟 User 继承 Person

```ts
type Person = { name: string; age: number }
type User = Person & {id: number; email: string }
const u: User = {
    name: 'Jack', age: 100,id: 666,
    email: 'jackz@email.com'
}
```

### 类型体操

#### 0004-easy-pick