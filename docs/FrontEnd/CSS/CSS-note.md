#### CSS tips

##### ul 中的 li 元素横向排列

```css
list-style: none; /* 前面默认有小圆点 */
/* 将其变成块级元素后，让li具有高度和宽度，padding,text-align等属性才起作用. */
display: inline-block;

float：left;
```

##### inline 元素之间的空格

```
  inline元素之间的【空白字符、换行符】会被浏览器渲染为一个空格
  即：占用一个字符的宽度
  [1]移除空格/回车
  [2]使用margin负值
  [3]让闭合标签（尾标签）吃胶囊
  [4]使用font-size:0
  [5]使用letter-spacing
  [6]使用word-spacing

  解决方法：
  1）li标签之间不换行；->（不方便）
  2）ul内的字符尺寸设置为0[font-size: 0]；->其他字体也没了
      font-size:0 是个不具有可复用性的方案，因为无法将子元素的 font-size 恢复为合适的大小。所有子元素都必须以绝对长度进行重置。
  3）ul中设置 letter-spacing:-5px; li中设置 letter-spacing: normal;
    由于外部环境的不确定性，以及最后一个元素多出的父margin值等问题，这个方法不适合大规模使用。
  4）将尾标签去掉，最后一个列表的标签的结束（闭合）标签不能丢。
```

#### 文字属性

##### 常用属性

```css
/* 文本颜色 */
color: color-name/#fff(十六进制)/gba/rgba;
/* 文本对齐 水平方向*/
text-align: left/right/center;
/* 装饰文本 */
text-decoration: none/ underline / overline / line-throght;
/* 文本缩进 1em = 当前的font-size*/
text-indent: 10px/2em;
/* 行间距 */
 line-height: 26px;
/* 防止拖拽文本 */
resize: none;
/* 文本垂直居中 行高和高度一样 */
line-height:
/* 设置文本不可选中 */
user-select: none;
```

##### 文字垂直居中

```css
/*（1）单行文本，只需要将文本行高(line-height)和所在区域高度(height)设为相同 */
```

##### 文字下划线具体样式

```css
/* (1) text-decoration */
display: inline;
text-decoration: underline;

/* (2.1) border-bottom */
border-bottom: 0 -1px gray inset;
/* (2.2) border-bottom + 另两个属性一起调整间距 */
border-bottom: 1px solid gray;
display: inline-block;
line-height: 0.9;

/* (3) box-shadow 模拟下划线 */
box-shadow: 0 -1px gray inset;
```

#### 鼠标样式

[鼠标样式](https://www.w3schools.com/cssref/tryit.asp?filename=trycss_cursor)

```css
cursor: pointer / default 小白 默认 pointer 小手 move 移动 text 文本 not-allowed
  禁止;
```

#### CSS 属性书写顺序建议

1. 布局定位属性： display/position/float/clear/visibility/overflow(建议 dispaly 第一个写，关系到模式)

2. 自身属性： width/height/margin/padding/border/background

3. 文本属性： color/font/text-decoration/text-align/vertical-align/white-space/break-word

4. 其他属性(css3)：conntent/cursor/border-radius/box-shadow/text-shadow/background:linear-gradient...

#### -webkit-box 水平垂直居中

[https://blog.csdn.net/BIG_LEE_SHOW/article/details/79246182]

```json
display：box
-webkit-box-flex
-webkit-box-pack: center;	 /*让元素水平居中，还有其他属性，官方文档有解释*/
-webkit-box-align: center; /*让元素垂直居中，包含其他属性，官方文档有解释*/

```

#### 图片处理

##### 背景

- `linear-gradient`

##### object-fit

```css
.fill {
  object-fit: fill;
}
.contain {
  object-fit: contain;
}
.cover {
  object-fit: cover;
}
.none {
  object-fit: none;
}
.scale-down {
  object-fit: scale-down;
}
```

`fill`: 中文释义“填充”。默认值。替换内容拉伸填满整个 content box, 不保证保持原有的比例。
` contain`: 中文释义“包含”。保持原有尺寸比例。保证替换内容尺寸一定可以在容器里面放得下。因此，此参数可能会在容器内留下空白。
`cover`: 中文释义“覆盖”。保持原有尺寸比例。保证替换内容尺寸一定大于容器尺寸，宽度和高度至少有一个和容器一致。因此，此参数可能会让替换内容（如图片）部分区域不可见。
` none`: 中文释义“无”。保持原有尺寸比例。同时保持替换内容原始尺寸大小。
` scale-down`: 中文释义“降低”。就好像依次设置了 none 或 contain, 最终呈现的是尺寸比较小的那个。

#### input

##### placeholder 颜色

```css
input::input-placeholder {
  color: red !important;
}
::-webkit-input-placeholder {
  /* WebKit browsers */
  color: red !important;
}
:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: red !important;
}
::-moz-placeholder {
  /* Mozilla Firefox 19  */
  color: red !important;
}
:-ms-input-placeholder {
  /* Internet Explorer 10  */
  color: red !important;
}
```

#### 布局 flex

`display: flex;`

容器上的属性

```css
- flex-direction 主轴的方向
- - 默认为row 水平方向左端为起点 [row | row-reverse | column | column-reverse]

- flex-wrap 是否换行
- - 默认不换行 [nowrap | wrap | wrap-reverse ]

- flex-flow
- - flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap。
  - [<flex-direction> <flex-wrap>]

- justify-content 在主轴上的对齐方式
- - [flex-start | flex-end | center | space-between | space-around]
  - 水平方向排列，center 的话，左右居中对齐

- align-items 在交叉轴上的对齐方式
- - [flex-start | flex-end | center | baseline | stretch]
  - 水平方向排列，center的话，上下居中对齐

- align-content 多个轴的对齐方式
```

项目上的属性：

```css
- order 定义项目的排列顺序
- flex-grow 项目的放大比例，
- - 默认为0，存在剩余空间，也不会放大
  - 如果都为1，则等分剩余空间，
  - 如果有个项目为2，其他的是1，则它占其他的两倍

- flex-shrink 项目的缩小比例
- - 默认为1，空间不足，则缩小
  - 如果大家都为1，空间不足的时候等比例缩小
  - 一个为0，其他为1，0的那个不缩小，其他的等比例缩小

- flex-basis
- - 分配多余空间之前，项目占的主轴空间。浏览器根据该值计算是否有剩余空间
  - 默认值为auto,如果设置px之类的数值，会占据固有空间

- flex
- -  flex-grow, flex-shrink 和 flex-basis的简写，默认值为0 1 auto。
  -  该属性有两个快捷值：auto (1 1 auto) 和 none (0 0 auto)。
  -  建议优先使用这个属性，而不是单独写三个分离的属性，因为浏览器会推算相关值

- align-self
- - 可覆盖 align-items 属性，
  - 默认为auto,即继承父元素的align-items
  - 如果没有父元素，则等同stretch
```

#### 前端自适应的讨论

- [前端做自适应，是否需要做成两套代码，手机端和电脑端分开维护？](https://www.v2ex.com/t/866075)
  > 自适应是多套设计，多套代码。响应式是一套代码。网站信息结构简单的可以用响应式，复杂的要想体验好，目前主流还是做自适应。
  >
  > 业务复杂的话做两套；两套东西迭代起来反而是问题最少的；对交互要求比较高的，都是两套，最多就是把一些逻辑抽出来公用；
  >
  > 代码实现可参考苹果官网。

#### bootstrap

##### bootstrap 中的 `col-md-*`

一句话概括，就是根据显示屏幕宽度的大小，自动的选用对应的类的样式

```
1.  col 是 column 简写：列
2.  xs 是 maxsmall 简写：超小，
    sm 是 small 简写：小，
    md 是 medium 简写：中等，
    lg 是 large 简写：大；
3.  -\* 表示占列数，即占每行 row 分 12 列栅格系统比；
4.  .col-xs-_ 超小屏幕如手机 （<768px）时使用；
    .col-sm-_ 小屏幕如平板 （768px ≤ 宽度 ＜ 992px）时使用；
    .col-md-_ 中等屏幕如普通显示器 （992px ≤ 宽度 ＜ 1200px）时使用；
    .col-lg-_ 大屏幕如大显示器 （≥1200px）时使用。
```

栅格系统都会自动的把每行 row 分为 12 列，`col-xs-* 、col-sm-* 、col-md-* 、.col-lg-*` 后面跟的参数表示在当前的屏幕中的占列数。

例如: `<div class="col-xs-6 col-md-3"></div>`

这个 div 在屏幕中占的位置是：
`.col-xs-6` 在超小屏幕中占 6 列，也就是屏幕的一半（12/6 列=2 个 div），
`.col-md-3` 在中等屏幕中占 3 列也就是 1/4（12/3 列=4 个 div）。

反推，
如果我们要在移动端并排显示 3 个 div(12/3 个=每个占 4 列 )，则 `col-xs-4`；
在 PC 端上显示 6 个 div(12/6 个=每个占 2 列 ) ，则 `col-md-2`。
