#### 自问

会 react 么？

- react16.8
- useEffect 如何模拟挂载与卸载事件
- useState 与 useRef 的功能与区别
- 封装一个倒计时 hook

#### react 单 html 代码

- 引入 `react.development.js` 核心库
- 引入`react-dom.development.js` 支持 react 操作 DOM
- 引入`babel.min.js` 将 jsx 转为 js

```html
<script type="text/babel">
  // JSX 语法
  const vDOM = <h1>HELLO</h1>; // 虚拟DOM
  const rDOM = document.getElementbyId("app");
  ReactDOM.render(vDOM, rDOM);
</script>
```

#### JSX 语法

不能写引号，可用括号'()'；
只能有一个根目录，必须闭合；
标签中 js 表达式，使用{}，注释也用{}包起来；
标签中样式的类名，用 `className` 执行；
内联样式用 `style={{color:"white"}}`，属性名转为小驼峰；
标签首字母：
大写：React 会寻找与之同名的组件，找到则使用，未找到则报错；
小写：React 找同名的 html 标签，找到则转为 html 同名元素，未找到则报错。
事件："onClick"

#### React 类组件生命周期

16.3.0 版本前
16.3.0 版本后

重要的：

- constructor
  通常只做 2 件事：
  通过给 `this.state` 赋值对象来初始化内部的 state;
  为事件绑定实例（this）。
- componentDidMount
  在组件挂载后（插入 DOM 树中）立即调用
  - 依赖于 DOM 的操作可以在这里进行；
  - 在此处发送网络请求（官方建议）
  - 可在此处添加一些订阅
- componentDidUpdate
  在更新后会被立即调用（首次渲染不会执行）
  - 组件更新后，可在此处对 DOM 进行操作；
  - 若对更新前后的 props 比较，可在此处进行网络请求
    当 props 未发生变化时，则不会执行网络请求
- componentWillUnmount
  在组件卸载及销毁之前调用
  - 此方法中执行必要的清理操作
  - 例：清理 timer；取消网络请求；清除 componentDidMount 中的订阅。

#### 大神们用到的技术

- 后台管理用 antd mui 比较多，开发效率高，antd 的问题是全局样式污染，mui 的默认组件信息密度过小了。
  - 面向用户的界面不去使用这些 ui 框架最好，需要什么组件都手写，或者使用小颗粒的库，比如 popperjs 做定位引擎，d3js 写数据可视化等，这样定制效果好
- 后台用 antd。其他都是 tailwindcss 撸
- mui 和 chakra ui
  - mui 需要多看文档，像收缩导航栏得自己封装，不像 antd 的直接拿来用就好了，但是 mui 的 DataTable 挺强的
- 【https://hackertalk.net/posts/319721802743046144】很多人在问技术栈，我把之前的回答补充一下：
  - 前端：react + redux + recoil + router + d3js + i18next + puppeteer(dynamic render for seo) + redux-saga + axios + mswjs(api mock) + jest + tailwindcss + prosemirror + mathjax + material icon + 手写的一堆组件
  - 后端：spring boot + session + security gateway + websocket + zookeeper + sleuth + nacos + snowflakeID + grpc + rocketmq + redis + mysql/pg + nodejs + querydsl + jpa(write)/mybatis(read)
  - 后端可随时切换成单机 docker 部署，抛弃分布式组件。
  - 运维/工具：shell/yaml + serverless + Kubernetes + ci + github + jetbrains 全家桶/vscode + postman + jmeter + xtools/automouseclick(自动化点击机器人) + 一些简单的 python 脚本做爬虫/数据分析
- react-router-dom 的 v6 版本最近刚出，和视频里的 v5 版本变化比较大，npm 的时候注意控制下版本 — 2021-11-09

  ```bash
  npm install react-router-dom@版本号
  ```

  P77. 路由基础。如果使用的 react-router-dom 版本是 v6，则需要用 Routes 把 Route 包裹起来。同时 Route 标签中的 conponent 要换成 element，且引用的组件名称要使用尖括号。

#### React 组件库

docs:

- [github > react-study](https://github.com/linjunc/react-study)
- Wscats https://github.com/Wscats/articles

组件库：

- [折叠面板 rsuitejs](https://rsuitejs.com/zh/components/panel)
- 时间处理 moment
- 响应式 【fresnel -- github】
- react-beautiful-dnd
- react-intl
- [sandbox > react-flip-move > todolist](https://codesandbox.io/s/ijmgm) sandbox
- [sandbox > react-images-uploading](https://codesandbox.io/s/d7kbv) sandbox

很赞的 github lib

- [Music163-React](https://github.com/wanguano/Music163-React)
- [react-admin](https://github.com/yezihaohao/react-admin) 有 demo 展示

#### React 的 issues

##### antd card 设置响应式个数 [Done]

```html
<Col className="gutter-row" span={6} key={i} xs={12} sm={8} md={6} lg={4}>
  <Card></Card>
</Col >
```

这里的 `xs={12} sm={8} md={6} lg={4}` 分别对应 `2,3,4,6 ` 个 card 了。

##### React 创建项目

- 创建 React 项目**(**三种方式**)** https://blog.csdn.net/weixin_45242865/article/details/121671094

```bash
npx create-react-app react-web
```

##### React 中返回上一个页面保留原来的值

##### React 中嵌入 svg 文件

```jsx
import logo from "./logo.svg";

<img src={heart} alt="heart" style={{ width: "16px" }} />;
```

##### React 预览网址的图片

##### React 中使用 iconfont

https://www.iconfont.cn/help/detail?helptype=code

##### React 中使用图片

##### React 弹出窗口

Reactjs PopUp：如何在 **React** 中轻松创建弹出窗口？ https://www.copycat.dev/blog/reactjs-popup/

##### React 提交表单

遇到问题：`Too many re-renders`

```bash
["Error: Too many re-renders. React limits the number of renders to prevent an infinite loop."]
```

解决：

`<button onClick={() => { onSell() }}`

onClick 函数会被立即调用，用箭头函数包装函数，求值代码会生成一个函数，用户点击按钮时可以调用该函数

##### React 每次都加载 vendors，花了多时间，每个页面都加载

[推荐使用 lazy 懒加载的](https://stackoverflow.com/questions/57117878/create-react-app-reduce-build-size-main-hash-chunk-js-is-3mb-with-mostly-ima) 将静态图片等移到 CDN

##### 在 useEffect 中 setState , 可能导致陷入循环中

##### react 重定向网址, 几种方式

```jsx
// 方式一
import { useParams, useHistory } from "react-router-dom";
let history = useHistory();
history.push(`/asset/${nftChain}/${nftAddress}/${tokenId}`);
```

##### react 刷新当前页面

类似刷新按钮、地址栏回车：`window.location.reload()`

##### react 局部更新

只更新一个小组件，比如 button 的状态

在需要更新的地方，用 setState 的方式，将新的状态传入

##### react 中使用 useContext

这篇文章很详细 https://dmitripavlutin.com/react-context-and-usecontext/

另外：子组件中的 `const value = useContext(Context); ` 里的 Context 变量从哪里来？

其一，在父组件定义 context 的时候可以把它暴露出去

```jsx
export const Context = createContext(null); //  父组件中暴露出去
import C from 'xxxxx--父组件的路径'； //  子组件再引进
```

有其他方式吗？

这篇文章 【https://mp.weixin.qq.com/s/DWXS4XV4Ii52NeG6nIshGQ】

##### react 单页面应用，页面跳转不刷新

```jsx
/*=====================================================*/
//react之路由跳转
hashHistory.push({
  pathname: "pathname", //路径
  query: { name: "小花" }, //传值
});
browserHistory.push({
  pathname: "home", //路径
  query: { name: "23ddd4" }, //传值
});
//注意：
// 如果你路由配置的是hashHistory则用第一种跳转
// 如果用的是browserHistory则用第二种路由跳转

/*=====================================================*/
//fatherComp中，使用Router
import { BrowserRouter, Switch, Route } from "react-router-dom";
function App() {
  return (
    <BrowserRouter>
      <HeaderComp />
    </BrowserRouter>
  );
}

//使用的组件childComp, 要包裹在Router中
import { useHistory } from "react-router";
const history = useHistory();
<a onClick={() => history.push(`/`)}></a>;
/*=====================================================*/
```

##### react route

```json
单页面应用Router的实现机制？（这道是淘宝前端一面的面试题，有同学就栽在这道题上）
为什么 React Router 中使用 Switch 关键字 ？
React Router 与常规路由有何不同？
它是怎么实现跳转不刷新页面的？
React 路由的底层实现原理是怎样的？
文档博客：https://blog.csdn.net/huangpb123/article/details/90274022
视频： https://www.bilibili.com/video/BV1Kp4y1k7Kc
1、深度理解路由概念及原理，轻松应对面试
2、掌握路由出现的背景以及优缺点
3、掌握完整路由库背后的设计思路
4、掌握多种路由方式的使用场景
5、手写实现 BrowserRouter、Route、Link 标签
```

##### createContext 是根据发布订阅模式来实现的？

【todo: 看源码核实】

##### useMemo 与 React.memo 关系区别？

【todo: 要打例子、看源码】

##### reder-props

【https://react.docschina.org/docs/render-props.html todo: 要打例子】

##### react 的 hooks 代替 shouldcomponentupdate 优化方案

【https://zh-hans.reactjs.org/docs/hooks-faq.html#how-do-i-implement-shouldcomponentupdate todo: 可反复研读，要打例子】

##### react 的 SEO 优化(非 SPA 也可)

这篇文章 react 的 SEO 问题 【https://ahrefs.com/blog/zh/react-seo/#1-what-is-react】
vue 作者对 SEO 的回答：https://www.zhihu.com/question/51949678/answer/146656850

##### react 懒加载中 suspense

https://zh-hans.reactjs.org/docs/code-splitting.html#reactlazy

##### 报错的总结

```bash
Warning: Can't perform a React state update on an unmounted component. This is a no-op, but it indicates a memory leak in your application. To fix, cancel all subscriptions and asynchronous tasks in a useEffect cleanup function.
中文：无法对未安装的组件执行 React 状态更新。这是一个空操作，但它表明您的应用程序中存在内存泄漏。要解决此问题，请在 useEffect 清理函数中取消所有订阅和异步任务。

MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 101 "accountsChanged" listeners added. Use emitter.setMaxListeners() to increase limit.
MaxListenersExceededWarning:检测到可能的EventEmitter内存泄漏。增加了101个“accountsChanged”监听器。使用emitter.setMaxListeners()来增加limit。

index.js:1 Warning: Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.
超过最大更新深度。当组件在 useEffect 中调用 setState 时，可能会发生这种情况，但 useEffect 要么没有依赖数组，要么每次渲染时依赖项之一发生变化。

TypeError: Cannot read property 'push' of undefined
使用 useHistory 将路由器添加到 DOM中。
必须将<Router>...</Router>包裹住使用 useHistory 的组件


Warning: Cannot update a component (`AssetProvider`) while rendering a different component (`App`). To locate the bad setState() call inside `App`, follow the stack trace as described
这个错误是指这种情况：
1. setState放在componentDidMount() useEffects()里
2. 在标签中调用 onClick = {moveTo(move)} 需要用箭头函数包裹，否则立即执行。
3. 可能有其他情况，待补充
```

#### Error

```bash
1. 'default' (imported as 'connect') was not found in 'react-redux';
2. 'Switch' (imported as 'Switch') was not found in 'react-router-dom';
3. 'Redirect' (imported as 'Redirect') was not found in 'react-router-dom';
4. 'Icon' (imported as 'Icon') was not found in 'antd';
```

A1：没有 `export default` ，需要大括号包住.

```jsx
import { connect } from "react-redux";
```

A2：`react-router-dom` v6 版本， `"Switch"` 被 `"Routes"` 替代了. [[stackoverflow answer](https://stackoverflow.com/a/69849271)]
A3：`react-router-dom` v6 版本，`"Redirect"` 被 `"Navigate"` 替代了.
A4：`Antd` 升级到 v4，其中一个重大的突破变化是，`'Icon'` 不再从 `'antd'` 包导出。

```jsx
// before
<Icon type="smile" />;
// v4
import { SmileOutlined } from "@ant-design/icons";
<SmileOutlined />;
```

#### Redux

redux 官网 http://cn.redux.js.org/introduction/getting-started

redux 原理图

##### state

多个组件共享和使用相同 state

​ 将共享 state 从组件中提取出来（lifting-state-up）

不可变性 immutability

​ JS 对象、JS 数组默认都是 mutable

​ 不可变的方式：先复制原来的，在更新它的复制体

​ obj 用展开符{…obj}

​ arr 用 concat()新建、slice()复制

##### action

一个对象，具有 type 字段（字符串）、payload 字段，描述 app 中发生了什么事

```jsx
const addTodoAction = {
  type: "todos/todoAdded",
  payload: "Buy milk",
};
```

##### Reducers

一个函数，接收当前的 state 和一个 action 对象，

(state, action)=>newState，

可将 reducer 看做事件监视器，根据收到的 action（事件）类型处理事件。

只依赖 state 和 action 来计算 newState；

要使用 immutable updates

禁止任何异步逻辑、依赖随机值或其他‘副作用’代码

```jsx
const initialState = {value:0}
function counterReducer(state=initialState, action){
	if(action.type===‘counter/increment’){
		return {…state, value:state.value+1}
	}
	return state
}
```

##### Store

一个对象，存 Redux 的状态，通过传入 reducer 来创建，有一个 getState 方法。

```jsx
import {configureStore} form ‘@reduxjs/toolkit’
const store = configureStore({reducer:counterReducer})
console.log(store.getState) // {value:0}
```

##### Dispatch

Redux store 中的一个方法，更新 state 的唯一方法，传入一个 action 对象。

dispatch 一个 action 可以理解为触发一个事件。

```tsx
store.dispatch({type:’counter/increment’})
console.log(store.getState) // {value:1}
```

##### Selectors

函数，可以从 state 状态树中提取指定的片段。

遇到 app 的不同部分需要读取相同的数据，可避免重复读取逻辑。

```tsx
const selectCounterValue = (state) => state.value;
const currentValue = selectCounterValue(store.getValue());
console.log(store.getState); // {value:2}
```

redux toolkit https://www.bilibili.com/video/BV1MU4y1U7Lw

#### styled-components

安装: `yarn add styled-components`

```jsx
import styled from "styled-components";

//修改了div的样式
const Title = styled.div`
  font-size: 1.5rem;
  color: red;
`;
// 修改了button的样式
const Button = styled.button`
  border: none;
  background: ${(props) => (props.blue ? "blue" : "yellow")};
  color: ${(props) => props.inputColor || "blue"};
`;

class App extends Component {
  render() {
    return (
      <>
        {
          // 开始的内容
          /* <div>大红牛</div>
    <button>枸杞11</button> */
        }
        <Title>大红牛</Title>
        <Button blue inputColor="red">
          枸杞
        </Button>
      </>
    );
  }
}
export default App;
```
