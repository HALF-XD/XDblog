- [2018 年一个博主带源码](https://medium.com/the-z/making-a-resizable-div-in-js-is-not-easy-as-you-think-bda19a1bc53d)

### JS 获取元素的大小（高度和宽度）

[例子]()
元素尺寸属性和说明

```
- clientWidth 获取元素可视部分的宽度，即 CSS 的 width 和 padding 属性值之和，元素边框和滚动条不包括在内，也不包含任何可能的滚动区域
- clientHeight 获取元素可视部分的高度，即 CSS 的 height 和 padding 属性值之和，元素边框和滚动条不包括在内，也不包含任何可能的滚动区域
- offsetWidth 元素在页面中占据的宽度总和，包括 width、padding、border 以及滚动条的宽度
- offsetHeight 元素在页面中占据的高度总和，包括 height、padding、border 以及滚动条的宽度
- scrollWidth 当元素设置了 overflow:visible 样式属性时，元素的总宽度，也称滚动宽度。在默认状态下，如果该属性值大于 clientWidth 属性值，则元素会显示滚动条，以便能够翻阅被隐藏的区域
- scrollHeight 当元素设置了 overflow:visible 样式属性时，元素的总高度，也称滚动高度。在默认状态下，如果该属性值大于 clientWidth 属性值，则元素会显示滚动条，以便能够翻阅被隐藏的区域
```

1. `clientHeight` = `padding-top` + `height` + `border-buttom-width` - `滚动条的宽度`;
2. `offsetHeight` = `border-top-width` + `padding-top` + `height` + `padding-buttom` + `border-buttom-width`;
3. `scrollHeight` = `padding-top` + `包含内容的完全高度` + `padding-bottom`;

宽度的计算方式可以以此类推

### 偏移量

offsetLeft

偏移量：包括元素在屏幕上占用的所有可见空间,元素的可见大小有其高度，宽度决定，包括所有内边距，滚动条和边框大小（注意，不包括外边距）。

以下 4 个属性可以获取元素的偏移量

- offsetHeight：元素在垂直方向上占用的空间大小，以像素计。包括元素的高度（可见的），水平滚动条的高度，上边框高度和下边框高度。【只读属性】
- offsetWidth：元素在水平方向上占用的空间大小，以像素计。包括元素的宽度（可见的），垂直滚动条的宽度，左边框宽度和右边框宽度。【只读属性】
- offsetLeft：元素的左外边框至包含元素的左内边框之间的像素距离。【只读属性】
- offsetTop：元素的上外边框至包含元素的上内边框之间的像素距离。【只读属性】

其中 offsetLeft，offsetTop 属性与包含元素有关，包含元素的引用保存在 offsetParent 中，
**注意** offsetParent 与 parentNode 的值不一定相等。
