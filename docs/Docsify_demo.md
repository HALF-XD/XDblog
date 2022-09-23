## docsify 插件效果展示

---

<details class="xd-details">
<summary>Click to open</summary>
<p>If your browser supports this element, it should allow you to expand and collapse these details.</p>
</details>

---

<details class="xd-details">
<summary>Show code</summary>
<pre>
222
</pre>
</details>

---

[跳转指定位置](#divtop)

> [!NOTE]
> An alert of type 'comment' using style 'callout' with default settings.

> [!TIP|style:callout|label:My own heading|iconVisibility:hidden]
>
> - [【本章节置顶资源下载】1](https://mp.weixin.qq.com/s/XUHnLCbq7mDWhOc9imTVzg)

> [!WARNING]
>
> - [自学编程一路走来，这些私藏工具和网站我全贡献出来了](https://mp.weixin.qq.com/s/XUHnLCbq7mDWhOc9imTVzg)

> [!ATTENTION]
>
> - An alert of type 'comment' using style 'callout' with default settings.

> [!COMMENT]
> An alert of type 'comment' using style 'callout' with default settings.

程序员在平时的日常**工作**、**学习**、**开发**、**做笔记**、**写博客** 等过程中还是有很多好用并且高效的**在线工具推荐**的，毕竟我们不是每时每刻我们都需要那种很重量级的本地软件。

<!-- tabs:start -->

#### **一**

content1

#### **二**

<!-- panels:start -->

<!-- div:left-panel -->

content2

<!-- div:right-panel -->

content3

<!-- panels:end -->

<!-- tabs:end -->

<a id="divtop"> 我是目标位置</a>

#### docsify

[docsify doc](docsify.js.org)

```shell
# 安装 docsify-cli
npm i docsify-cli -g

# 创建文档目录并初始化
docsify init ./docs

# 启动本地服务
docsify serve docs
## 如果有安装Python
cd docs && python -m SimpleHTTPServer 3000
cd docs && python -m http.server 3000
```

#### 插件

```shell
#tabs
# panel 内容可左右分布
docsify-example-panels
# alert
docsify-plugin-flexible-alerts
```
