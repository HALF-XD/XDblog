行内元素、块元素之间的一些规则？

#### span

文本级的标签，里面只能放置文字、图片、表单元素。

#### rel="noreferrer" HTML 属性

- [noreferrer](https://www.reliablesoft.net/noreferrer-noopener/#noreferrer)

rel="noreferrer" 标签是一个特殊的 HTML 属性，可以添加到链接标签 (<a> )。
它通过从 HTTP 标头中删除引荐信息来防止将引荐来源信息传递到目标网站。

```html
<a href="https://www.example.com" rel="noreferrer">Link to Example.com</a></a>
```

#### meta 标签的常用用法？

1. 搜索引擎优化（SEO）
2. 定义页面使用语言
3. 自动刷新并指向新的页面
4. 实现网页转换时的动态效果
5. 控制页面缓冲
6. 网页定级评价
7. 控制网页显示的窗口

- [Metadata Content](http://man.hubwiz.com/docset/HTML.docset/Contents/Resources/Documents/developer.mozilla.org/en-US/docs/Web/Guide/HTML/Content_categories.html)

#### HTML 公共属性

| 属性            | **描述**                                               |
| --------------- | ------------------------------------------------------ |
| accesskey       | 规定激活元素的快捷键。                                 |
| class           | 规定元素的一个或多个类名（引用样式表中的类）。         |
| contenteditable | 规定元素内容是否可编辑。                               |
| contextmenu     | 规定元素的上下文菜单。上下文菜单在用户点击元素时显示。 |
| data-\*         | 用于存储页面或应用程序的私有定制数据。                 |
| dir             | 规定元素中内容的文本方向。                             |
| draggable       | 规定元素是否可拖动。                                   |
| dropzone        | 规定在拖动被拖动数据时是否进行复制、移动或链接。       |
| hidden          | 规定元素仍未或不再相关。                               |
| id              | 规定元素的唯一 id。                                    |
| lang            | 规定元素内容的语言。                                   |
| spellcheck      | 规定是否对元素进行拼写和语法检查。                     |
| style           | 规定元素的行内 CSS 样式。                              |
| tabindex        | 规定元素的 tab 键次序。                                |
| title           | 规定有关元素的额外信息。                               |
| translate       | 规定是否应该翻译元素内容。                             |

#### CSS link 和@import 的区别

- 区别 1： link 是 XHTML 标签，除了加载 CSS 外，还可以定义 RSS 等其他事务； @import 属于 CSS 范畴，只能加载 CSS 。
- 区别 2： link 引用 CSS 时，在页面载入时同时加载； @import 需要页面网页完全载入以后加载。
- 区别 3： link 是 XHTML 标签，无兼容问题； @import 是在 CSS2.1 提出的，低版本的浏览器不支持。
- 区别 4： link 支持使用 Javascript 控制 DOM 去改变样式；而 @import 不支持。

#### src 与 href 的区别

src 和 href 都是**用来引用外部的资源**，它们的区别如下：

- **src：** 表示对资源的引用，它指向的内容会嵌入到当前标签所在的位置。src 会将其指向的资源下载并应⽤到⽂档内，如请求 js 脚本。当浏览器解析到该元素时，会暂停其他资源的下载和处理，直到将该资源加载、编译、执⾏完毕，所以⼀般 js 脚本会放在页面底部。
- **href：** 表示超文本引用，它指向一些网络资源，建立和当前元素或本文档的链接关系。当浏览器识别到它他指向的⽂件时，就会并⾏下载资源，不会停⽌对当前⽂档的处理。 常用在 a、link 等标签上。

#### iframe 优缺点

##### 优点

- iframe 能够原封不动的把嵌入的网页展现出来。
- 如果有多个网页引用 iframe，那么只需要修改 iframe 的内容，就可以实现调用每一个页面的更改，方便快捷。
- 网页如果为了统一风格，头部和版本都是一样的，就可以写成一个页面，用 iframe 嵌套，可以增加代码的可重用。
- 如果遇到加载缓慢的第三方内容，如图标或广告，这些问题可以由 iframe 来解决。

##### 缺点

- iframe 会阻塞主页面的 Onload 事件；
- 搜索引擎的检索程序无法解读这种页面，不利于 SEO;
- iframe 和主页面共享连接池，而浏览器对相同域的连接有限制，所以会影响页面的并行加载。
- 使用 iframe 之前需要考虑这两个缺点。如果需要使用 iframe ，最好是通过 javascript 动态给 iframe 添加 src 属性值，这样可以绕开以上两个问题。

#### title 与 h1 的区别、b 与 strong 的区别、i 与 em 的区别

- strong 标签有语义，是起到加重语气的效果，而 b 标签是没有的，b 标签只是一个简单加粗标签。b 标签之间的字符都设为粗体，strong 标签加强字符的语气都是通过粗体来实现的，而搜索引擎更侧重 strong 标签。
- title 属性没有明确意义只表示是个标题，H1 则表示层次明确的标题，对页面信息的抓取有很大的影响
- i 内容展示为斜体，em 表示强调的文本

#### label 标签的作用

- label 标签来定义表单控制间的关系,当用户选择该标签时，浏览器会自动将焦点转到和标签相关的表单控件上。

```html
<label for="Name">Number:</label>
<input type="text" name="Name" id="Name" />
<label>Date:<input type="text" name="B" /></label>
```

#### html 中 title 属性和 alt 属性的区别

[效果展示](./html__img-alt-title.html)

```html
<img src="#" alt="alt信息" />
```

当图片不输出信息的时候，会显示 alt 信息 鼠标放上去没有信息，当图片正常读取，不会出现 alt 信息。

```html
<img src="#" alt="alt信息" title="title信息" />
```

- 当图片不输出信息的时候，会显示 alt 信息 鼠标放上去会出现 title 信息；
- 当图片正常输出的时候，不会出现 alt 信息，鼠标放上去会出现 title 信息。
- 除了纯装饰图片外都必须设置有意义的值，搜索引擎会分析。

浏览器兼容性:
img 的提示信息有 `alt=""` 和 `title=""` 两个属性，这两个属性是为做到兼容所有的浏览器，
alt 是 w3c 提倡的，是官方的，title 是为了兼容一些老版本的浏览器和 IE 的，为了最大兼容，建议 alt title 都写上。
