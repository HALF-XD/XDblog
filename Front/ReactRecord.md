#### 自问

会react么？

- react16.8
- useEffect 如何模拟挂载与卸载事件
- useState 与 useRef 的功能与区别
- 封装一个倒计时 hook

#### 大神们用到的技术

- 后台管理用 antd mui 比较多，开发效率高，antd 的问题是全局样式污染，mui 的默认组件信息密度过小了。

  - 面向用户的界面不去使用这些ui框架最好，需要什么组件都手写，或者使用小颗粒的库，比如 popperjs 做定位引擎，d3js 写数据可视化等，这样定制效果好

- 后台用antd。其他都是tailwindcss撸

- mui和chakra ui

  - mui需要多看文档，像收缩导航栏得自己封装，不像antd的直接拿来用就好了，但是mui的DataTable挺强的

- 【https://hackertalk.net/posts/319721802743046144】很多人在问技术栈，我把之前的回答补充一下：

  前端：react + redux + recoil + router + d3js + i18next +  puppeteer(dynamic render for seo) + redux-saga + axios + mswjs(api mock) + jest + tailwindcss + prosemirror + mathjax + material icon + 手写的一堆组件

  后端：spring boot + session + security gateway + websocket + zookeeper + sleuth + nacos + snowflakeID + grpc + rocketmq + redis + mysql/pg +  nodejs + querydsl + jpa(write)/mybatis(read)

  后端可随时切换成单机 docker 部署，抛弃分布式组件。

  运维/工具：shell/yaml + serverless + Kubernetes + ci + github + jetbrains  全家桶/vscode + postman + jmeter + xtools/automouseclick(自动化点击机器人) + 一些简单的  python 脚本做爬虫/数据分析

- react-router-dom 的v6版本最近刚出，和视频里的v5版本变化比较大，npm的时候注意控制下版本 — 2021-11-09 

  ```bash
  npm install react-router-dom@版本号
  ```

  P77. 路由基础。如果使用的react-router-dom版本是v6，则需要用Routes把Route包裹起来。同时Route标签中的conponent要换成element，且引用的组件名称要使用尖括号。

#### 工具网站

- Base64 在线编码解码  https://base64.us/# 

- Unix时间戳转换  https://tool.chinaz.com/tools/unixtime.aspx
- svg 图标 iconfont 网站 

#### React 组件库 

响应式 【fresnel -- github】

折叠面板【rsuitejs】https://rsuitejs.com/zh/components/panel/ 

时间处理 moment 

 GMT+8 代表北京时间

#### styled-components

安装:  `yarn add styled-components`

```jsx
import styled from 'styled-components'

//修改了div的样式
const Title = styled.div`
  font-size:1.5rem;
  color:red
`
// 修改了button的样式
const Button = styled.button`
    border:none;
    background: ${props=>props.blue?"blue":"yellow"};
		color: ${ props => props.inputColor || "blue" };
`

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
    <Button blue inputColor="red">枸杞</Button>
    </>
    )
  }
}
export default App;
```

#### React网站

react 教程 — 天禹老师：https://www.bilibili.com/video/BV1wy4y1D7JT

网友总结的react文档：

​	1- https://github.com/linjunc/react-study

​	2- https://github.com/xzlaptt/React

​	3-Wscats https://github.com/Wscats/articles

#### React的issues

##### antd card 设置响应式个数 [Done] 

```html
<Col className="gutter-row" span={6} key={i} xs={12} sm={8} md={6} lg={4}>
  <Card></Card>
</Col >
```

这里的 `xs={12} sm={8} md={6} lg={4}` 分别对应 `2,3,4,6 ` 个card了。

##### React 创建项目

- 创建React项目**(**三种方式**)** https://blog.csdn.net/weixin_45242865/article/details/121671094

```bash
npx create-react-app react-web
```

##### React 中返回上一个页面保留原来的值

##### React 中嵌入svg文件

```jsx
import logo from './logo.svg'

<img src={heart} alt="heart" style={{ width: "16px" }} />
```

##### React 预览网址的图片

##### React 中使用 iconfont

 https://www.iconfont.cn/help/detail?helptype=code

##### React 中使用图片

##### React弹出窗口

Reactjs PopUp：如何在 **React** 中轻松创建弹出窗口？ https://www.copycat.dev/blog/reactjs-popup/

##### React 提交表单

遇到问题：`Too many re-renders`

``` bash
["Error: Too many re-renders. React limits the number of renders to prevent an infinite loop."]
```

解决：

`<button onClick={() => { onSell() }}`

onClick函数会被立即调用，用箭头函数包装函数，求值代码会生成一个函数，用户点击按钮时可以调用该函数

##### React  每次都加载 vendors，花了多时间，每个页面都加载

 [推荐使用lazy 懒加载的](https://stackoverflow.com/questions/57117878/create-react-app-reduce-build-size-main-hash-chunk-js-is-3mb-with-mostly-ima)  将静态图片等移到CDN

##### 在 useEffect 中 setState , 可能导致陷入循环中

##### react 重定向网址, 几种方式

```jsx
// 方式一
import { useParams, useHistory } from 'react-router-dom'
let history = useHistory();
history.push(`/asset/${nftChain}/${nftAddress}/${tokenId}`)
```

##### react 刷新当前页面

类似刷新按钮、地址栏回车：`window.location.reload()`

##### react 局部更新

只更新一个小组件，比如button的状态

在需要更新的地方，用setState的方式，将新的状态传入

##### react 中使用useContext

这篇文章很详细 https://dmitripavlutin.com/react-context-and-usecontext/

另外：子组件中的 `const value = useContext(Context); ` 里的Context变量从哪里来？

其一，在父组件定义context的时候可以把它暴露出去

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
  pathname:'pathname',//路径
  query:{name:'小花'}//传值
})
browserHistory.push({
  pathname: "home",//路径
  query: { name: "23ddd4" }//传值
});
//注意：
// 如果你路由配置的是hashHistory则用第一种跳转
// 如果用的是browserHistory则用第二种路由跳转

/*=====================================================*/ 
//fatherComp中，使用Router
import { BrowserRouter, Switch, Route } from "react-router-dom";
function App(){
  return(
  	 <BrowserRouter>
       <HeaderComp />
     </BrowserRouter>
  )
}

//使用的组件childComp, 要包裹在Router中
import { useHistory } from "react-router";
const history = useHistory();
<a onClick={() => history.push(`/`)}></a>
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

##### createContext是根据发布订阅模式来实现的？

【todo: 看源码核实】

##### useMemo与React.memo关系区别？

【todo: 要打例子、看源码】

##### reder-props 

【https://react.docschina.org/docs/render-props.html todo: 要打例子】

##### react 的hooks代替 shouldcomponentupdate 优化方案
【https://zh-hans.reactjs.org/docs/hooks-faq.html#how-do-i-implement-shouldcomponentupdate todo: 可反复研读，要打例子】

##### react的SEO优化(非SPA也可)
这篇文章react的SEO问题 【https://ahrefs.com/blog/zh/react-seo/#1-what-is-react】
vue作者对SEO的回答：https://www.zhihu.com/question/51949678/answer/146656850

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



#### Redux

redux官网 http://cn.redux.js.org/introduction/getting-started

redux原理图

##### state

多个组件共享和使用相同state

​	将共享state从组件中提取出来（lifting-state-up）

不可变性 immutability

​	JS对象、JS数组默认都是mutable

​	不可变的方式：先复制原来的，在更新它的复制体

​		obj用展开符{…obj}

​		arr用concat()新建、slice()复制

##### action

一个对象，具有type字段（字符串）、payload字段，描述app中发生了什么事

```jsx
const addTodoAction = {
	type: 'todos/todoAdded',
	payload:'Buy milk'
}
```

##### Reducers

一个函数，接收当前的state和一个action对象，

(state, action)=>newState，

可将reducer看做事件监视器，根据收到的action（事件）类型处理事件。

只依赖state和action来计算newState；

要使用immutable updates

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

一个对象，存Redux的状态，通过传入reducer来创建，有一个getState方法。

```jsx
import {configureStore} form ‘@reduxjs/toolkit’
const store = configureStore({reducer:counterReducer})
console.log(store.getState) // {value:0}
```

##### Dispatch

Redux store中的一个方法，更新state的唯一方法，传入一个action对象。

dispatch一个action可以理解为触发一个事件。

```tsx
store.dispatch({type:’counter/increment’})
console.log(store.getState) // {value:1}
```

##### Selectors

函数，可以从state状态树中提取指定的片段。

遇到app的不同部分需要读取相同的数据，可避免重复读取逻辑。

```tsx
const selectCounterValue = state=>state.value
const currentValue = selectCounterValue(store.getValue())
console.log(store.getState) // {value:2}
```

redux toolkit https://www.bilibili.com/video/BV1MU4y1U7Lw