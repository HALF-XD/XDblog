### slide show 轮播图

[视图位移版 例子](https://half-xd.github.io/blog_sorted_case/js-case-code/slideshow/case-2.html)
[简单位移版 示例](https://half-xd.github.io/blog_sorted_case/js-case-code/slideshow/case-1.html)

#### 轮播图要实现的步骤和效果

首先分析要实现的效果：

1. 多张图片按效果顺序呈现

具体实现任务：

1. 显示和隐藏左右按钮：鼠标移入，左右按钮显示；鼠标离开，左右箭头隐藏。
2. 动态生成小圆点
   1. 获取所有图片,循环创建新的 li,
   2. 给新的 li 设置索引号（自定义属性）
   3. 给新的 li 注册点击事件
   4. 把 li 添加到 ol 中;
3. 单击小圆点，小圆点呈现选中白色，移动图片
   1. 排他样式,去掉所有 li 的白色样式,留下当前 li.
   2. 移动 ul:获取索引号,计算 ul 的移动位置,使用动画函数

#### 直接跳转版

京东首页轮播图

```html
<div class="sliderWrapper">
  <div class="sliderBanner">
    <button class="slider_control slider_control_prev"></button>
    <div class="slider_list">
      <li class="slider_item"><img src="#" /></li>
      <li class="slider_item"><img src="#" /></li>
    </div>
    <button class="slider_control slider_control_next"></button>
    <div class="slider_indicators"></div>
  </div>
</div>
```
