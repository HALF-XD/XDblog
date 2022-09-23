### React组件的更新机制

#### 笔记：React组件的更新机制

React组件的更新机制 https://www.zhihu.com/question/442368205/answer/2590697263

React默认：父组件或兄弟组件触发更新，会按照父组件、子组件的顺序重新渲染，即使子组件自身没发生任何变化，也会重复触发更新。

避免重复渲染的方式：memo、useCallBack、useMemo

##### memo

https://zh-hans.reactjs.org/docs/react-api.html#reactmemo

React.memo 仅检查props变更。

功能理解为：

\- 被调用时返回传入的组件

\- 每次传入的组件要执行更新时，组件的新props和之前的老props会进行一次**浅比较**：

​	- 结果相等，不触发更新

​	- 结果不相等，触发更新，重新渲染

##### useMemo

https://zh-hans.reactjs.org/docs/hooks-reference.html#usememo

```jsx
// 返回一个 memoized 值。
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
```



useMemo 仅在某个依赖项改变时，重新计算memorized值。

功能理解为：

在检测到依赖项数组中的变量发生变化时，重新执行传入的**function**，并返回传入**function**执行后的结果。

##### useCallBack: useMemo的语法糖

https://zh-hans.reactjs.org/docs/hooks-reference.html#usecallback

`useCallback(fn, deps)` 相当于 `useMemo(() => fn, deps)`

```jsx
// 返回一个 memoized 回调函数。
const memoizedCallback = useCallback(() => {doSomething(a, b);},[a, b]);
```

##### 注意

使用useMemo、useCallBack 时，本身会产生额外的开销，并且这两个方法必须和 memo 搭配使用，否则很可能会变成负优化。	

因此，在实际项目中，需要结合实际场景，评估重复渲染和创建 useCallBack / useCallBack 的开销来判断到底用不用useCallBack、useMemo。

-- 网友：大佬我组件老是重新渲染，那你memo一下，memo可不行啊，clickfn不一样，那你usecb一下，usecb不行啊，有闭包问题，那你usestate,usemem,useref一下。



### React 顶层API 

#### React Suspense

从 React 16.6+ 开始，React 添加了执行延迟加载的 [React Suspense](https://zh-hans.reactjs.org/docs/react-api.html#reactsuspense)。

React利用  `React.lazy` 与 `import()` 实现了渲染时的动态加载 ，并利用 `Suspense` 来处理异步加载资源时页面应该如何显示的问题。





