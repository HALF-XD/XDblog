####  网站逻辑部分

```json
nftAddress/tokenId/sell 页面，
在创建auction之前的授权
先检查是否授权
myErc721: isApprovedForAll(owner, operator)
myErc20: allowance(owner, spender)
用户调用方法，授权aup可以划取myErc721和myErc20
await myErc721.setApprovalForAll(address_aup, true)
await myErc20.approve(address_aup, 10000)
```

#### nft 项目 TODO

SPA 页面数据
- [一种spa单页面实现方法及系统](https://patents.google.com/patent/CN108491206A/zh)
- 按需加载，`lazyload`

Tips:
- `e.target.value`的数据类型
- `trim()`
- str 中包含字符小数点： `_value.indexOf('.') > -1`

合约部分：
- 切换`ethereum`账户和`chain`，识别和刷新数据
- `bid`前查用户余额
- `bid`前调合约 `estimategas` 检查,获取该交易是否会失败
- 没有`ERC20`余额，提醒去`faucet`
- 完成`faucet`功能

react部分：
  - 挂单的流程： 
    - 设置 `amount` 和 `endTime`, 点击按钮
    - 单页面应用，网页不需要刷新
    - `useContext`统一数据
    - 修一下：主页点进`assetPage1`，在反应的时候跳出，再点另一个`asset2`的时候，先显示`asset1`的信息，再调到`asset2`的内容
    - `button`统一样式
    - `load`样式

完成的部分
- 【切换`ethereum`账户和`chain`，项目自动识别和刷新数据】
- 【`useContext`统一数据】


> [!NOTE|style:callout|label:参考文章|iconVisibility:hidden]
> - [createContext 你用对了吗？](https://www.shuzhiduo.com/A/Gkz13gNZ5R/) 
> 这篇文章提到两个问题以及对应的解决方案 
>
> - [如何有效减少使用useContext导致的不必要渲染](https://wenku.baidu.com/view/88348a4ec9aedd3383c4bb4cf7ec4afe04a1b18f.html) 
> 这篇文章提到的方法：拆分context、useMemo、发布订阅
>
>   - (1) `createContext` 是根据发布订阅模式来实现的，`Provider` 的`value` 值每次发生变化都会通知使用 `useContext` 的组件重新渲染。解决办法：将`context.provider`组件抽离出来，子组件通过`props`的`children`属性传递进来。
> 
>   - (2) 使用`Provider`直接包裹子组件，`context.provider`组件渲染会导致所有子组件跟着重新渲染，因为`React.createElement(type, props:{}, … )` 创建的组件，每次 `props:{} `都是一个新对象。解决办法：局部渲染，用`useMemo`修改子组件，`React.memo`
>
> - [How to Use Async Actions for Global State With React Hooks and Context](https://blog.openreplay.com/how-to-use-async-actions-for-global-state-with-react-hooks-and-context) 这篇文章提到，在获取数据前后，设置 loading 的 true false.
>
> 解决一个问题：用useContext获取异步数据。



	