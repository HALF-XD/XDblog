## LESS基本语法总结

**什么是LESS**

LESS是CSS预处理器，简单来说，LESS是比CSS更高一级的语言，它拥有CSS不具备的语法。但他不能被浏览器直接识别，需要预处理工具将LESS文件转化为CSS文件才行。

**LESS还是SASS**

SASS明显更优秀，如果可以的话，推荐使用SASS，但是LESS可以简单配置，仅仅依靠CDN或者npm install就可以使用，适用于某些环境。他们之间语法的差距不大，建议都学一下。

**资料来源**

更多信息建议参考以下网站

[LESS中文网](https://link.zhihu.com/?target=https%3A//less.bootcss.com/) [LESS更详细教程](https://link.zhihu.com/?target=https%3A//www.bootcss.com/p/lesscss/) [LESS英文官网](https://link.zhihu.com/?target=http%3A//lesscss.org/) [LESS教程W3Cschool](https://link.zhihu.com/?target=https%3A//www.w3cschool.cn/less/)

## 安装

node js中安装

```bash
npm install -g less

//使用LESS编译器
>lessc styles.less styles.css
```

浏览器中使用，可以引入CDN

```html
<link rel="stylesheet/less" type="text/css" href="styles.less" />
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.11.1/less.min.js" ></script>
```

## 基本知识

### 注释

除css注释外,LESS还支持//注释

### 变量

LESS可以像JS一样声明变量

```less
//声明
@width: 10px;


//在属性值中使用变量
#header {
    width:@width;
}


==== 插值语法 ====

//选择器中使用变量
@my-selector: banner;

.@{my-selector} {
    width:100px;
}

//URL中使用变量
@images: "../img";

body {
    background:url("@{images}/white-sand.png");
}
```

### 作用域

同JS一样,LESS变量向父级作用域查找

```less
@var: red;

#page {
  @var: white;
  #header {
    color: @var; // white
  }
}
```

### 导入外部less（@import）

```less
@import "lib.less";
@import "lib";
```

### 嵌套（nesting）

嵌套是一种简写css选择器的方法

```less
//嵌套将会将父级和祖级元素添加到前面
#header {
    color:black;
    .logo {   //等同于#header .logo
        color:red; 
        tr {     //等同于#header .logo tr
            color:yellow;
        }
    }
}
```

### 父级选择器

LESS通过&简写父级选择器

```less
a {
    color:blue;
    &:hover {        //等同于 a:hover
        color:green;
    }

    & + & {  // a + a
        color:white;
    }

    &-children {  // a-children
        color:black;
    }
}
```

### 冒泡

针对媒体查询，这样同样的样式就不用复写了。

```less
.component {
    width:300px;
    color:white;
    @media (min-width: 768px) {  // 等于复写一个@media>.component，已有的color属性将写入，width将覆盖
        width:600px;
    }
}
```

### 运算

LESS支持+,-,*,/运算，基本同JS

属性值的单位将参与换算，如果12px+12px = 24px

当单位无法换算时,取消单位计算，12em+12px  = 24

### 转义

转义中的文字将会原样输出,不会进行计算和转化

```less
//less 3.5以下版本
@data: ~"min-width:640px";

//less 3.5+
@min768: (min-width: 768px);
```

## 语言拓展

### Mixins 混入样式

Mixin将一个样式集，“混入”另一个样式中，主要是方便简写复用属性

```less
.borderd {
    border-top:2px;
}
#main a {
    color:white;
    .borderd();   //border-top:2px
}
```

### 带参数的混入样式

```less
.border-radius(@radius){
    border-radius:@radius;
}

//调用
header {
    .border-radius(4px);  //border-radius: 4px;
}
```

### 参数可带默认值,可多个,可覆盖, 和@arguments

```less
.border-radius (@radius: 5px,@color:yellow) {
    ....

    //@arguments 变量包含所有参数的值
}

//调用
header {
    .border-radius; //直接调用
    .border-radius(2px) //部分覆盖

}
```

### 不带参数(隐藏混入)

```less
// 集合将被隐藏,不会暴露到css中
.wrap(){
    text-wrap:wrap;    
}


//调用
pre {
    .wrap
}
```

### 命名空间

命名空间用于在某一样式下声明的mixin，这样可以和其他mixin区分开

```less
.bundle {
    mixin(){
        ...
    }
}

//调用
.bundle>mixin()
```

### 模式匹配的混合样式

```less
//我们可以给多个样式匹配同一指定
.mixin (dark, @color) {  //只接受dark为首参
  color: darken(@color, 10%);
}
.mixin (light, @color) {  //只接受light为首参
  color: lighten(@color, 20%);
}
.mixin (@_, @color) {  //接受任意值
  display: block;
}
```

### 样式继承(Extend)

```less
.inline{
    width:100px;
}

nav ul {
    &:extend(.inline);
    color:white;
}
```

### 样式合并(merge)

```less
1,逗号合并(使用+)
.myfunc() {
  box-shadow+: 5px 5px 5px grey;
}
.class {
  .myfunc();
  box-shadow+: 0 0 5px #f78181;
}
//  结果box-shadow: 5px 5px 5px grey, 0 0 5px #f78181;


2,空格合并(使用 + 或 +_)
.mixin() {
  transform+_: scale(1);
}
.class {
  .mixin();
  transform+_: rotate(2deg);
}
//结果:  transform: scale(1) rotate(2deg);
```

### 导引(Guards)

导引类似条件判断，LESS通过导引混合而非if/else语句来实现条件判断，因为前者已在@media query特性中被定义。

```less
.mixin (@a) when (lightness(@a) >= 50%) {   //后面的运算为true值，则应用样式
  background-color: black;
}

.mixin(#ddd); 


//导引中可用的全部比较运算有： >， >=， =， =<， <。，
//注意a=b，等同于js中a==b
//此外，关键字true只表示布尔真值,除去关键字true以外的值都被视示布尔假
//使用not关键字表示非


//导引序列使用逗号‘,’—分割,表示&&
.mixin (@a) when (@a > 10), (@a < -10) { ... }

//参数比较运算
.max (@a, @b) when (@a > @b) { width: @a }


//is*函式检验是否为某数据类型
.mixin (@a) when (isnumber(@a)) and (@a > 0) { ... }


//CSS Guards(略)
.style when (@usedScope=mixin)
```

### 循环

通过导引来实现循环语句

```less
.cont(@count) when (@count > 0) {
  .cont((@count - 1));
  width: (25px * @count);
}
div {
  .cont(7);
}
```

### 映射（Maps）

从 Less 3.5 版本开始，你还可以将混合（mixins）和规则集（rulesets）作为一组值的映射（map）使用。

```less
#colors() {
  primary: blue;
  secondary: green;
}

.button {
  color: #colors[primary];
  border: 1px solid #colors[secondary];
}
```

### JavaScript 表达式引入

LESS引入JS很简单，只需要反引号

```less
//使用反引号表示
@var: `"hello".toUpperCase() + '!'`;
```

## 内置函数

[函数手册](https://link.zhihu.com/?target=https%3A//less.bootcss.com/functions/%23logical-functions)

```text
@width: 0.5;
percentage(@width); //50%
```

### 例：color函数

```less
lighten(@color, 10%);     // return a color which is 10% *lighter* than @color
darken(@color, 10%);      // return a color which is 10% *darker* than @color

saturate(@color, 10%);    // return a color 10% *more* saturated than @color
desaturate(@color, 10%);  // return a color 10% *less* saturated than @color

fadein(@color, 10%);      // return a color 10% *less* transparent than @color
fadeout(@color, 10%);     // return a color 10% *more* transparent than @color
fade(@color, 50%);        // return @color with 50% transparency

spin(@color, 10);         // return a color with a 10 degree larger in hue than @color
spin(@color, -10);        // return a color with a 10 degree smaller hue than @color

mix(@color1, @color2);    // return a mix of @color1 and @color2
```

### 例：Math 函数

```less
round(1.67); // returns `2`
ceil(2.4);   // returns `3`
floor(2.6);  // returns `2`
percentage(0.5); // returns `50%`
```