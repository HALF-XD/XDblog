Front End Optimization 前端优化
Improve web performance 提高网页性能

### 前端性能优化总结【转】

- [前端性能优化总结 -- 知乎（成楠 Peter）](https://zhuanlan.zhihu.com/p/350333912)
- [性能优化问题 -- 博客](https://fe.mbear.top/xing-neng-you-hua/033-xing-neng-you-hua-wen-ti-lao-si-ji-ru-he-jie-jue-shang)

<!-- tabs:start -->

#### **前端指标**

1. FP，First Paint。
2. FCP，First Content Paint。
3. FMP，First Meaning Paint。
4. ATF，Above The Fold，首屏时间
5. TTI，Time To Interact，首次交互时间，可以用 DomReady 时间。
6. 资源总下载时间。Load 时间 >= DomContentLoaded 时间
   （1）Dom 加载完时间，DomContentLoaded。
   （2）页面资源加载完时间，Load，包括图片，音视频等异步资源。但是资源加载完之后，页面还没有完全稳定，完全稳定的时间由 finish 决定。
7. 服务端重要接口加载速度。
8. 客户端启动容器（WebView）时间。

#### **优化方向**

> 前端性能优化分为两个方向，一是工程化方向，另一个是细节方向。这个概念来自于知乎 Lucas HC。

<!-- panels:start -->

<!-- div:left-panel -->

**工程化方向**

1. 客户端 Gzip 离线包，服务器资源 Gzip 压缩。
2. JS 瘦身，Tree shaking，ES Module，动态 Import，动态 Polyfill。
3. 图片加载优化，Webp，考虑兼容性，可以提前加载一张图片，嗅探是否支持 Webp。
4. 延迟加载不用长内容。通过打点，看某些弹窗内或者子内容是否要初始化加载。
5. 服务端渲染，客户端预渲染。
6. CDN 静态资源
7. Webpack Dll，通用优先打包抽离，利用浏览器缓存。
8. 骨架图
9. 数据预取，包括接口数据，和加载详情页图片。
10. Webpack 本身提供的优化，Base64，资源压缩，Tree shaking，拆包 chunk。
11. 减少重定向。

<!-- div:right-panel -->

**细节方向**

1. 图片，图片占位，图片懒加载。 雪碧图
2. 使用 prefetch / preload 预加载等新特性
3. 服务器合理设置缓存策略
4. async（加载完当前 js 立即执行）/defer(所有资源加载完之后执行 js)
5. 减少 Dom 的操作，减少重排重绘
6. 从客户端层面，首屏减少和客户端交互，合并接口请求。
7. 数据缓存。
8. 首页不加载不可视组件。
9. 防止渲染抖动，控制时序。
10. 减少组件层级。
11. 优先使用 Flex 布局。

<!-- panels:end -->

#### **卡顿问题解决**

1. CSS 动画效率比 JS 高，css 可以用 GPU 加速，3d 加速。如果非要用 JS 动画，可以用 requestAnimationFrame。
2. 批量进行 DOM 操作，固定图片容器大小，避免屏幕抖动。
3. 减少重绘重排。
4. 节流和防抖。
5. 减少临时大对象产生，利用对象缓存，主要是减少内存碎片。
6. 异步操作，IntersectionObserver，PostMessage，RequestIdleCallback。

#### **性能优化 API**

1. Performance。performance.now()与 new Date()区别，它是高精度的，且是相对时间，相对于页面加载的那一刻。但是不一定适合单页面场景。
2. window.addEventListener("load", ""); window.addEventListener("domContentLoaded", "");
3. Img 的 onload 事件，监听首屏内的图片是否加载完成，判断首屏事件。
4. RequestFrameAnmation 和 RequestIdleCallback。
5. IntersectionObserver、MutationObserver，PostMessage。
6. Web Worker，耗时任务放在里面执行。

#### **检测工具**

1. Chrome Dev Tools
2. Page Speed
3. Jspref

<!-- tabs:end -->

### 2

```
性能优化：
1. 减少HTTP请求次数和大小；
- 资源合并和压缩；
- 图片懒加载
- 音视频走流文件
DNS缓存；
304缓存；

渲染过程：
                DOM
                 ↓
HTML  --→   HTML-Parser --→ DOM-Tree        Layout
                               ↓              ↓
                            Attachment --→ Render-Tree --→ Painting --→ Display
                               ↑
Style-Sheets → CSS-Parser → Style-Rules
```

### 前端性能优化

<!-- tabs:start -->

#### **页面内容**

- 减少 `HTTP` 请求数 Reducing HTTP requests
- 减少 `DNS` 查询
- 避免重定向
- 缓存 `Ajax` 请求
- 延迟加载
- 预加载 [跳转](#预加载)
- 减少 `DOM` 元素数量
- 划分内容到不同域名
- 尽量减少 `iframe` 使用
- 避免 404 错误

#### **服务器**

- 使用 `CDN`
- 添加 `Expires` 或 `Cache-Control` 响应头
- 启用 `Gzip`
- 配置 `Etag`
- 尽早输出缓冲
- `Ajax` 请求使用 `GET` 方法
- 避免图片 `src` 为空

#### **Cookie**

- 减少 `Cookie` 大小
- 静态资源使用无 `Cookie` 域名

#### **移动端**

- 保持单个文件小于 25KB
- 打包内容为分段 `multipart` 文档

#### **图片**

- 优化图片 [Image optimization]
- 优化 `CSS Sprite`
- 不要在 HTML 中缩放图片
- 使用体积小、可缓存的 `favicon.ico`

#### **JavaScript**

- 把脚本放在页面底部
- 使用外部 `Javasrcip` 和 `CSS`
- 压缩 `JavaScrip` 和 `CSS` [File compression]
- 移除重复脚本
- 减少 DOM 操作 [跳转](#减少-dom-操作)
- 使用高效的事件处理

#### **CSS**

- 把样式表放在 `<head>` 中
- 不要使用 CSS 表达式
- 使用 `<link>` 替代 `@import`
- 不要使用 `filter`

<!-- tabs:end -->

#### read

资料：

- [前端性能优化浅谈](https://www.cnblogs.com/Leo_wl/p/12658495.html#_labelTop)
- [CDN 是什么？使用 CDN 有什么优势？](https://www.zhihu.com/question/36514327?rf=37353035)
- [前端系列主题：从宏观到细节为前端性能优化全方位讲解！](https://blog.csdn.net/weixin_49547540/article/details/116430104)
- [从宏观的角度讨论网络应用怎么运行及其前端代码系统编写和优化](https://blog.csdn.net/u011537073/article/details/120766357)
- [Web 前端性能优化--课程](https://coding.imooc.com/class/130.html)

<!-- tabs:start -->

#### **一、资源的合并和压缩**

- html 压缩
- css 代码压缩
- js 压缩与混乱（丑化）
- 文件合并

#### **二、图片相关的优化**

- 图片压缩
- css 雪碧图
- 网页内联图片（Image inline）
- 矢量图 SVG 与 iconfont
- webp ".jpg_.webp"格式

#### **三、浏览器渲染引擎与阻塞**

- 渲染过程
- css 阻塞
- js 阻塞

#### **四、懒加载和预加载**

- 懒加载
- 预加载

#### **五、重绘与回流**

- CSS 图层
- 创建图层的条件
- 重绘（Repaint）
- 回流（Reflow） [跳转搭配](#jump1)
- 触发回流的常见操作
- 请求动画帧（requestAnimationFrame）

```
重排与重绘
重排: 部分渲染树（或者整个渲染树）需要重新分析并且节点尺寸需要重新计算。这被称为重排。注意这里至少会有一次重排-初始化页面布局。
重绘: 由于节点的几何属性发生改变或者由于样式发生改变，例如改变元素背景色时，屏幕上的部分内容需要更新。这样的更新被称为重绘。

减少重绘和重排就是要减少对渲染树的操作
（1）直接改变元素的`className`
（2）`display：none`；
  - 先设置元素为 `display：none`;然后进行页面布局等操作；设置完成后将元素设置为`display：block`；这样的话就只引发两次重绘和重排；
  - 通过 `visibility: hidden` 隐藏一个 DOM 节点-只触发重绘，因为没有几何变化
（3）使用`cloneNode(true or false)` 和 `replaceChild` 技术，引发一次回流和重绘；
（4）将需要多次重排的元素，`position`属性设为`absolute`或`fixed`，元素脱离了文档流，它的变化不会影响到其他元素；
（5）如果需要创建多个DOM节点，可以使用`DocumentFragment`创建完后一次性的加入`document`；
```

```
触发重排的操作
任何页面布局和几何属性的改变都会触发重排
1. 页面的初次渲染（===>无法避免）
2. DOM树（DOM节点）的结构变化：(===>一次性重写style;切换class;)
  元素的添加、删除（可见的dom元素）
  元素位置改变（未脱离文档流的情况下）
  元素的几何属性变化（尺寸、位置，`padding`，`margin`等）
  元素内容改变：文字数量、字体大小、图片大小
3. 浏览器窗口大小调整缩放，触发 `resize`(===>)
4. 读取某些属性，包括:(===>获取时应当做适当的缓存)
`offsetTop`、`offsetLeft`、` offsetWidth`、`offsetHeight`、
`scrollTop`、`scrollLeft`、`scrollWidth`、`scrollHeight`、
`clientTop`、`clientLeft`、`clientWidth`、`clientHeight`、
`getComputedStyle()`

场景: 列表排序，先获取列表dom节点，在内存中排序，然后一次性渲染，可以显著减少重排次数。
```

#### **六、函数防抖与节流**

- 函数防抖 https://www.bilibili.com/video/BV17b4y1X7yp

```
防抖的case:
  (1) 自动感应门: 不能关太快，设定延时关门的时间 N秒
      N秒内还有人通过，重新计时；N秒内没有人通过，执行关门。
  (2) 输入框连续输入的请求次数控制: 防止表单多次提交；（连续输入文字后发送 AJAX 请求进行验证，验证一次就好）
  (3)改变页面大小、滚动页面位置的统计: resize/scroll
  (4)点击按钮付款操作
步骤:
  1. （addEventListener监听到）点击事件 -> clearTimeout -> 重新 setTimeout
  2. setTimeout 的 delay 内是否再次被触发
    - 是，重新 setTimeout delay
    - 否，执行函数fn
难点和解决办法:
  1. 会直接执行函数,使用高阶函数，不立即执行
  2. timer需要先定义
    [传入一个错误的 ID 给 clearTimeout()不会有任何影响；也不会抛出异常。]
  3. timer定义在一个函数内，创建变量、清除延时、建立延时三个独立的执行函数操作互没关系
  4. fn中this指向问题，运行回调函数的时候是在window下了
  5. 执行的函数可能有参数，要把参数也考虑进去
    JS 的函数里没有设置参数，也可以传入参数
```

```html
<input type="button" value="点击pay" />
```

```js
let button = document.querySelector("input");

function pay() {
  console.log("---pay---");
}

function debounce(func, delay) {
  let timer;
  return function () {
    let context = this;
    let args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      func.apply(context, args);
    }, delay);
  };
}

button.addEventListener(
  "click",
  debounce(pay, 1000).bind(button, "123", "abc")
);
```

- 函数节流

```
节流应用场景:
  DOM 元素的拖拽功能实现（mousemove）
  射击游戏的 mousedown/keydown 事件（单位时间只能发射一颗子弹）
  计算鼠标移动的距离（mousemove）
  Canvas 模拟画板功能（mousemove）
  搜索联想（keyup）
  监听滚动事件判断是否到页面底部自动加载更多:
    给 scroll 加了 debounce 后，只有用户停止滚动后，才会判断是否到了页面底部；
    如果是 throttle 的话，只要页面滚动就会间隔一段时间判断一次
步骤:
  1. 触发事件，马上执行任务，然后设定时间间隔限制（3件事情）；
  2. 判断触发事件是否在时间delay间隔内
    是，不执行任务（timer被赋值了=任务还在等待执行，暂时不改变timer的值）
    否，执行任务（timer没有被赋值，就给timer赋值去执行任务）
难点和解决办法:
  1. 与防抖一样:函数会立即执行；timer定义赋值问题；this指向问题；传参问题；
  2. 有两种实现方式: timer定时器；Date()函数时间戳。
```

```html
<input type="button" value="点击pay" />
```

```js
let area = document.querySelector("pre");
area.addEventListener("mouseover", throttle(date, 1000).bind());

function date() {
  console.log(Date.now() / 1000);
}

function throttle(func, delay) {
  let pre = 0;
  return function () {
    let context = this;
    let args = arguments;

    let now = new Date();
    if (now - pre > delay) {
      func.apply(context, args);
      pre = now;
    }
  };
}

function _throttle(func, delay) {
  let timer; // 多个任务通过闭包的形式对timer变量进行操作
  return function () {
    let context = this;
    let args = arguments;
    if (timer) {
      return;
    }
    timer = setTimeout(function () {
      func.apply(context, args);
      timer = null;
    }, delay);
  };
}
```

#### **七、浏览器存储**

|                | cookie         | localStorage | sessionStorage |
| -------------- | -------------- | ------------ | -------------- |
| 大小           | 4kb            | 10Mb         | 5Mb            |
| 兼容           | H4/H5          | H5           | H5             |
| 访问           | 任何窗口       | 任何窗口     | 同一窗口       |
| 有效期         | 手动设置       | 无           | 到窗口关闭     |
| 存储位置       | 浏览器与服务器 | 浏览器       | 浏览器         |
| 与请求一起发送 | 是             | 否           | 否             |
| 语法           | 复杂           | 简易         | 简易           |

- Cookie

  - HTTP 是无状态的,Cookie 是一种存储机制，
  - 第一次 request 网页是没有任何 cookie 的；
  - Server 收到 request 后会在 HTTP 响应中添加头部 Set-Cookie，且在 Set-Cookie 中标识，
    下一次 request ，浏览器会在 HTTP request 里添加头部 Cookie,并用 Set-Cookie 中标识，
    Server 就能为不同用户匹配不同内容了
  - 【Server 给了 Set-Cookie 后，每次 HTTP request 都要把 Cookie 数据传给 Server】
  - 所以 Cookie 很小[94 年 带宽小]
  - document.cookie = `${key}=${value}`; // 设置 cookie,逐个设置；
  - 解决空格或其他编码问题: encodeURIComponent
  - cookie 保质期: max-age

- Web Storage

  [MDN-localStorage-资料](https://developer.mozilla.org/zh-CN/docs/web/api/window/localstorage)

  - 存储在 localStorage 的数据可以长期保留,没有过期时间设置;
  - 会永远保存在浏览器里，可自行删除；
  - 不参与服务器通信；
  - 同步的机制，会影响浏览器渲染进度

  ```js
  // 通过 Storage.setItem() 增加了一个数据
  localStorage.setItem("myCat", "Tom");
  // 读取 localStorage 项
  let cat = localStorage.getItem("myCat");
  // 移除 localStorage 项
  localStorage.removeItem("myCat");
  // 移除所有的 localStorage 项
  localStorage.clear();
  ```

  [MDN-sessionStorage-资料](https://developer.mozilla.org/zh-CN/docs/Web/API/Window/sessionStorage)

  - 页面会话在浏览器打开期间一直保持，并且重新加载或恢复页面仍会保持原来的页面会话。
  - `sessionStorage`会保存在浏览器里，关闭窗口就会被删除；
  - 打开多个相同的 URL 的 Tabs 页面，会创建各自的`sessionStorage`。
  - 关闭对应浏览器窗口（Window）/ tab，会清除对应的`sessionStorage`。

  > 存储在`sessionStorage`或`localStorage`中的数据特定于页面的协议。也就是说`http://example.com` 与 `https://example.com`的`sessionStorage`相互隔离。
  > 被存储的键值对总是以 UTF-16 DOMString 的格式所存储，其使用两个字节来表示一个字符。对于对象、整数 key 值会自动转换成字符串形式。

  ```js
  // 保存数据到 sessionStorage
  // 使用 Storage.setItem() 访问往里面添加一个数据条目。
  sessionStorage.setItem("key", "value");
  // 从 sessionStorage 获取数据
  let data = sessionStorage.getItem("key");
  // 从 sessionStorage 删除保存的数据
  sessionStorage.removeItem("key");
  // 从 sessionStorage 删除所有保存的数据
  sessionStorage.clear();
  ```

- IndexedDB
- PWA
- Service Worker

#### **八、HTTP 通用缓存策略**

- 缓存的简介
- 缓存相关的 header 字段
- 缓存策略

#### **九、服务端性能优化**

- CDN 服务器
- CDN Content Delivery Network 内容分发网络
  [CDN 是什么？使用 CDN 有什么优势？](https://www.zhihu.com/question/36514327?rf=37353035)
- [SSR(Server Side Rendering)]()

```
距离硬伤
分发内容 - 静态内容（长期不变）、动态内容 cache-control
分发流程
安全性和可靠性: 服务器宕机 转移流量-》负载均衡
一加一减
任播的技术
```

<!-- tabs:end -->

#### DocumentFragment

`DocumentFragment` 一次性添加，回流一次;直接操作 DOM，回流四次

```html
<ul id="list"></ul>
<script>
  const list = document.querySelector("#list");
  const fruits = ["Apple", "Orange", "Banana", "Melon"];

  const fragment = new DocumentFragment();

  fruits.forEach((fruit) => {
    const li = document.createElement("li");
    li.textContent = fruit;
    fragment.appendChild(li);
  });

  list.appendChild(fragment);
</script>
```

#### 避免 DOM 的回流

<a id="jump1"> 避免 DOM 的回流 </a>

```
（1）放弃传统操作dom的时代,基于vue/react开始数据影响视图模式
 	mwm/ mVc / virtual dom/ dom diff ....
（2）分离读写操作( 现代的浏览器都有渲染队列的机制)
 	offsetTop、offsetLeft、 offsetWidth、 offsetHeight、 clientTop、 clientLeft、 clientWidth、 clientHeight、scrollTop、 scrollLeft、 scrollWidth、 scrollHeight. getComputedStyle、 currentStyle...会刷新渲染队列
（3）样式集中改变
 	div.style. cssText = 'width:20px; height:20px;'
 	div.className = 'box';
（4）缓存布局信息
 	div.style.left = div.offsetLeft + 1+ 'px; divstyle.top = div.offsetTop+ 1+ 'px;
 	=>改为
 	var curLeft = div.offsetLeft: var curTop = div.offsetTop;
 	divstsle.left= curLeft+ 1+ 'px; div.style.top= curTop+1+ 'px;
（5）元素批量修改
 	文档碎片: createDocumentFragment
 	模板字符串拼接
（6）动画效果应用到position属性为absolute或fixed的元素上(脱离文档流)
（7）CSS3硬件加速( GPU加速) I
 	比起考虑如何减少回流重绘,我们更期望的是, 根本不 要回流重绘; transform\ opacity \ fiters ..这些属性会触发硬件加速,不会引发回流和重绘.. ..
 	可能会引发的坑:过多使用会占用大量内存，性能消耗严重、有时候会导致字体模糊等
（8）牺牲平滑度换取速度
 	每次1像素移动一个动画，但是如果此动画使用了100%的CPU ,动画就会看上去是跳动的,因为浏览器正在与更新回流做斗争。每次移动3像素可能看起来平滑度低了，但它不会 导致CPU在较慢的机器中抖动
（9）避免table布局和使用css的javascript表达式
```

#### DOM 操作性能优化建议

其实在 web 开发中，单纯因为 js 导致性能问题的很少，主要都是因为 DOM 操作引起的。

1 查找元素的优化
2 改变 DOM，包括添加，修改，删除 DOM
3 改变 DOM 的样式类等
4 批量修改 DOM
5 减少 iframe
6 样式放在 header 中，脚本放在关闭标签</body>之前

1 查找元素的优化
因为 ID 是唯一的，也有原始的方法，因此使用 ID 查找元素是最快的，其次的是根据类和类型查找元素，通过属性查找元素是最慢的，因此应该尽可能的通过 ID 或者类来查找元素，避免通过类来查找元素。
2 改变 DOM，包括添加，修改，删除 DOM
改变 DOM 就会引起浏览器渲染，而渲染是相当慢的，因此应该避免不必要的渲染

```
divUpdate.innerHTML = "";
for ( var i=0; i<100; i++ ){
  divUpdate.innerHTML += "<SPAN>This is a slower method! </SPAN>";
}
改为
var str="";
for ( var i=0; i<100; i++ ){
  str += "<SPAN>This is faster because it uses a string! </SPAN>";
}
divUpdate.innerHTML = str;
```

3 改变 DOM 的样式类等
改变 DOM 元素的样式，类也会导致浏览器渲染，因此也应该减少不必要的操作

```
var el = document.getElementById('mydiv');
el.style.borderLeft = '1px';
el.style.borderRight = '2px';
el.style.padding = '5px';
改为
var el = document.getElementById('mydiv');
el.style.cssText = 'border-left: 1px; border-right: 2px; padding: 5px;';
```

4 批量修改 DOM 时从文档流中摘除该元素 ，对其应用多重改变 ，将元素带回文档中
这样可以最小化重绘和重排版 ，
具体方法:
1 隐藏元素，进行修改，然后再显示它。
2 将原始元素拷贝到一个脱离文档的节点中，修改副本，然后覆盖原始元素。
5 减少 iframe
iframe 需要消耗大量的时间，并阻塞下载，建议少用  
 据说动态给 iframe 添加 URL 可以改善性能，未做测试
6 样式放在 header 中，脚本放在关闭标签</body>之前
样式放在 header 中，可以加快渲染，脚本放在关闭标签</body>之前可以加快下载速度，不免阻塞下载。

####
