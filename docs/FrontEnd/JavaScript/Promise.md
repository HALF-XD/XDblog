Promise

---

```js
const p = Promise((resolve, reject) => {});
```

- 新建后会立即执行；
- 三种状态：pending/ fulfilled/ rejected。一旦成功或失败，状态不再改变。
- 属性 status result.

---

`p.then();`

```js
new Promise((resolve, reject) => {
  // resolve();
  // reject();
})
  .then(
    () => {}, // 对应成功
    () => {} // 对应失败
  )
  .catch(() => {}); // 获取错误
```

`p.then()`返回值：一个新的 Promise 对象，状态为 pending。
`then()`中是异步代码。

---

链式操作：

```js
Promise((res, rej) => {})
  .then()
  .then();
```

---

catch 方法：

1. Promise 状态改为 rejected 时捕获 err。
2. 执行 Promise 体中代码错误时。
