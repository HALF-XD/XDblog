## docsify 插件效果展示
---
[跳转指定位置](#divtop)

> [!NOTE]
> An alert of type 'comment' using style 'callout' with default settings.

> [!TIP|style:callout|label:My own heading|iconVisibility:hidden]
>  - [【本章节置顶资源下载】1](https://mp.weixin.qq.com/s/XUHnLCbq7mDWhOc9imTVzg)

> [!WARNING]
>  - [自学编程一路走来，这些私藏工具和网站我全贡献出来了](https://mp.weixin.qq.com/s/XUHnLCbq7mDWhOc9imTVzg)

> [!ATTENTION]
>  - An alert of type 'comment' using style 'callout' with default settings.

> [!COMMENT]
> An alert of type 'comment' using style 'callout' with default settings.


程序员在平时的日常**工作**、**学习**、**开发**、**做笔记**、**写博客** 等过程中还是有很多好用并且高效的**在线工具推荐**的，毕竟我们不是每时每刻我们都需要那种很重量级的本地软件。

<!-- tabs:start -->

#### **在线画图工具**

> - 程序员经常接触的无非也就是流程图、思维导图、原型图、UML图、网络拓扑图、组织结构图等等这些。
> - 下面这四个在线画图网站我想应该足够了，其中那个processon是我用得最多的，历史文章中几乎所有相关的图形都是用它绘制，然后导出图片的。

- [在线画图工具ProcessOn](https://www.processon.com/)

#### **在线教程和文档**

> - 这部分主要集中了我在做开发过程中随手参考所要用到的几乎所有在线教程和官方文档，有中文版文档的我基本都优先列出来了，但更多时候是英文的官方文档。

<!-- panels:start -->

<!-- div:left-panel -->

- [Git中文教程](https://git-scm.com/book/zh/v2)
- [SVN中文手册](http://svnbook.red-bean.com/nightly/zh/index.html)
- [jQuery API中文文档](https://jquery.cuishifeng.cn/)

<!-- div:right-panel -->

- [Spring Boot官方文档](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
- [RabbitMQ官方文档](https://www.rabbitmq.com/documentation.html)
- [RocketMQ官方文档](http://rocketmq.apache.org/docs/quick-start/)

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

