#### JQuery

- 语法：
  ```js
  $(selector).action();
  ```
- 基础语法：
  ```js
  $(this).hide(); // 当前元素
  $("p").hide(); //所有p元素
  $("p.test").hide(); // 所有class="test"的p元素
  $("#test").hide(); // id="test"的元素
  ```
- 实例：
  ```js
  $(document).ready(function () {});
  $(function () {});
  ```
- 入口函数：
  ```js
  $(document).ready(function () {});
  $(function () {});
  ```

|          | JS window.onload       | $(document).ready()      |
| -------- | ---------------------- | ------------------------ |
| 执行时机 | 必要网页全部加载完毕   | 只需网页中 DOM 结构加载  |
| 执行次数 | 后面执行会将前面的覆盖 | 可执行多次，不会覆盖前面 |

#### JQuery 效果

- 隐藏和显示
  `.hide()` `.show()` `.toggle()`
- 淡入淡出
  `.fadeIn()` `.fadeOut()` `.fadeToggle()` `.fadeTo(slow/fase/time)`
- 滑动
  `.slideDown()` `.slideUp()` `.slideToggle()`
- 动画 `.animate()`
- 停止动画 `.stop()`
- callback 函数在当前动画 100%完成后执行
  ```js
  $("button").clike(function () {
    $("p").hide("slow", function () {
      alert("**");
    });
  });
  ```

#### JQuery 遍历

- 向上遍历-祖先
  `parent()` `parents()` `parentsUnntil()`
- 向下遍历-后代
  `children()` `find()`
- 同胞
  `siblings()` `next()` `nextAll()` `nextUntil()` `prev()` `prevAll()` `prevUntil()`
- 过滤
  `first()` `last()` `eq()` `filter()` `not()`
- 其他
  `add()` `addBack()` `closest()` `contents()` `each()` `end()`
  `has()` `is()` `offsetParent()` `alice()`
