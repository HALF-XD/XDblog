### XHR 请求-AJAX 通过 XMLHttpRequest 对象向服务器发送请求

#### AJAX 如何工作？

> AJAX 的 `XMLHttpRequest` 的对象与服务器通信。让我们尝试通过下面显示的图像了解 AJAX 的流程或 AJAX 的工作原理。

正如您在上面的示例中所`XMLHttpRequest`看到的，对象起着重要作用。

1. 用户从`UI`发送请求，，`JavaScript`中调用`XMLHttpRequest`对象。
2. `HTTP`请求由`XMLHttpRequest`对象发送到服务器。
3. `JSP`，使用，`PHP`，`Servlet`，`ASP.net`等与数据库交互。
4. 检索数据。
5. 服务器将`XML`数据或`JSON`数据发送到`XMLHttpRequest`函数。
6. `HTML`和`CSS`数据显示在浏览器上。

#### 向服务器发送请求

> `XMLHttpRequest`对象用于和服务器交换数据。
> 当您的页面全部加载完毕后，客户端会通过`XMLHttpRequest`对象向服务器请求数据，服务器端接受数据并处理后，向客户端反馈数据。
> 需要将请求发送到服务器，我们`XMLHttpRequest`使用对象的`open()`和`send()`方法：

```JS
xmlhttp.open("GET","ajax_info.txt",true);
xmlhttp.send();
```

| 方法                    | 描述                                                                                                                                                    |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 打开（方法，URL，异步） | 请求的类型，URL 以及是否初始化处理请求。<br> ● 方法：请求的类型； GET 或 POST<br> ● 网址：文件在服务器上的位置<br> ● 异步：true（异步）或 false（同步） |
| 发送（字符串）          | 将请求发送到服务器。<br> ● 字符串：仅用于 POST 请求                                                                                                     |

#### GET 还是 POST？

与`POST`等级，`GET`更简单也扭转，并且在大部分情况下都能使用。
然而，在以下情况中，请使用`POST`请求：
● 无法使用缓存文件（更新服务器上的文件或数据库）
● 向服务器发送大量数据（`POST`没有数据量限制）
● 发送包含未知字符的用户输入时，`POST`比`GET`更稳定也更可靠

#### GET 要求

一个简单的`GET`请求：

##### 实例 1

```JS
xmlhttp.open("GET","demo_get.html",true);
xmlhttp.send();
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
function loadXMLDoc(){
    var xmlhttp;
    if (window.XMLHttpRequest){
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","demo_get.php",true);
    xmlhttp.send();
}
</script>
</head>
<body>

<h2>AJAX</h2>
<button type="button" onclick="loadXMLDoc()">Request data</button>
<div id="myDiv"></div>

</body>
</html>
```

```PHP
// demo_get.php
<p style='color:red;'>本内容是使用 GET 方法请求的。</p>
<p style='color:red;'>请求时间：2020-09-17 22:36:28</p>
```

在上面的示例中，您可能得到的是缓存的结果。
　向避免这种情况，请向 URL 添加一个唯一的 ID：

##### 实例 2

```JS
xmlhttp.open("GET","demo_get.html?t=" + Math.random(),true);
xmlhttp.send();
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
function loadXMLDoc(){
    var xmlhttp;
    if (window.XMLHttpRequest){
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","demo_get.php?t=" + Math.random(),true);
    xmlhttp.send();
}
</script>
</head>
<body>

<h2>AJAX</h2>
<button type="button" onclick="loadXMLDoc()">Request data</button>
<p>Click the button several times to see if the time changes, or if the file is cached.</p>
<div id="myDiv"></div>

</body>
</html>
```

```PHP
// demo_get.php
<p style='color:red;'>本内容是使用 GET 方法请求的。</p>
<p style='color:red;'>请求时间：2020-09-17 22:40:55</p>
```

向您希望通过 GET 方法发送信息，，请向添加信息信息：

##### 实例 3

```JS
xmlhttp.open("GET","demo_get2.html?fname=Henry&lname=Ford",true);
xmlhttp.send();
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
function loadXMLDoc(){
    var xmlhttp;
    if (window.XMLHttpRequest){
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","demo_get2.php?fname=Henry&lname=Ford",true);
    xmlhttp.send();
}
</script>
</head>
<body>

<h2>AJAX</h2>
<button type="button" onclick="loadXMLDoc()">Request data</button>
<div id="myDiv"></div>

</body>
</html>
```

```PHP
// demo_get2.php
<p style='color:red;'>你好，Henry，今天过得怎么样？</p>
```

##### 提示：`GET`请求具有以下的几个特点：

● GET 请求可被缓存
● GET 请求保留在浏览器历史记录中
● GET 请求可被收藏为书签
● GET 请求提出在处理敏感数据时使用
● GET 请求有长度限制
● GET 请求只提供适当的取回数据

#### POST 要求

一个简单 POST 请求：

##### 实例 1

```JS
xmlhttp.open("POST","demo_post.html",true);
xmlhttp.send();
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
    function loadXMLDoc(){
        var xmlhttp;
        if (window.XMLHttpRequest){
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }else{
            // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST","demo_post.php",true);
        xmlhttp.send();
    }
</script>
</head>
<body>
    <h2>AJAX</h2>
    <button type="button" onclick="loadXMLDoc()">Request data</button>
    <div id="myDiv"></div>
</body>
</html>
```

```PHP
// demo_post.php
<p style='color:red;'>本内容是使用 POST 方法请求的。</p>
<p style='color:red;'>请求时间：20-09-17 03:42:47</p>
```

需要添加像`HTML`表单那样`POST`数据，使用请`setRequestHeader()`来添加 HTTP 头然后在。`send()`方法中规定您希望发送的数据：

##### 实例 2

```JS
xmlhttp.open("POST","ajax_test.html",true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send("fname=Henry&lname=Ford");
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
    function loadXMLDoc(){
        var xmlhttp;
        if (window.XMLHttpRequest){
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }else{
            // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST","demo_post2.php",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("fname=Henry&lname=Ford");
    }
</script>
</head>
<body>

<h2>AJAX</h2>
<button type="button" onclick="loadXMLDoc()">Request data</button>
<div id="myDiv"></div>

</body>
</html>
```

```PHP
// demo_post2.php
<p style='color:red;'>你好，，今天过得怎么样？</p>
```

| 方法                           | 描述                                                                    |
| ------------------------------ | ----------------------------------------------------------------------- |
| setRequestHeader(header,value) | 向请求添加 HTTP 头。<br> ● header: 规定头的名称<br> ● value: 规定头的值 |

##### 提示：`POST`请求的特色如下：

● POST 请求不会被缓存
● POST 请求不会保留在浏览器历史记录中
● POST 请求不能被收藏为书签
● POST 请求对数据长度没有要求

#### url-服务器上的文件

`open()`方法的`url`参数是服务器上文件的地址：

```JS
xmlhttp.open("GET","ajax_test.html",true);
```

该文件可以是任何类型的文件，例如`.txt`和`.xml`，或服务器脚本文件，例如`.asp`和`.php`（在传回响应之前，，能够在服务器上执行任务）。

#### 初步-对还是错？

`AJAX`异步的是异步`JavaScript`和`XM`L（异步 JavaScript 和 XML）。

`XMLHttpRequest`对象如果要使用`AJAX`的话，其`open()`方法的`sync`参数必须设置为 true 为

```
xmlhttp.open("GET","ajax_test.html",true);
```

对于 web 开发人员来说，发送到请求的请求是一个巨大的进步。很多在服务器执行的任务都相当费时。AJAX 出现之前，这可能会引起应用程序的挂起停止。

通过`AJAX`，`JavaScript`无需等待服务器的响应，甚至：
● 在等待服务器响应时执行其他脚本
● 当响应适当后后对响应进行处理

#### 异步= true

当使用`async=true`时，请规定在响应`onreadystatechange`中发生的事件的适当状态时执行的函数：

##### 实例

```JS
xmlhttp.onreadystatechange=function(){
    if (xmlhttp.readyState==4 && xmlhttp.status==200){
        document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
}
xmlhttp.open("GET","ajax_info.txt",true);
xmlhttp.send();
```

**案例**

```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tryrun 1</title>
</head>
<body>
    <div id="view">
        <p>点击下面的按钮，将 Ajax 请求回来的数据更新在该文本内</p>
    </div>
    <button type="button" id="btn">发起 Ajax 请求</button>
    <script>
        document.getElementById("btn").onclick = ajaxRequest;
        function ajaxRequest () {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "https://www.w3cschool.cn/statics/demosource/ajax_info.txt", true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("view").innerHTML = xhr.responseText;
                }
            }
        }
    </script>
</body>
```

#### 异步=false

如果使用`async=false`，替代`open()`方法中的第三个参数改为 false：

```JS
xmlhttp.open（＆quot; GET＆quot ;,＆quot; test1.txt＆quot ;, false）;
```

我们不推荐使用`async=false`，但是对于某些小型的要求，也是可以的。

记住，JavaScript 会等到服务器响应响应才继续执行。如果服务器可以或缓慢，应用程序会挂起或。

**注意**：当您使用`async=false`时，请不要`onreadystatechange`编写函数-把代码放到`send()`语句后面即可

##### 实例

```JS
xmlhttp.open("GET","ajax_info.txt",false);
xmlhttp.send();
document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
```

**案例**

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
    function loadXMLDoc(){
        var xmlhttp;
        if (window.XMLHttpRequest){
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }else{
            // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET","ajax_info.txt",false);
        xmlhttp.send();
        document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
</script>
</head>
<body>

<div id="myDiv"><h2>Let AJAX change this text</h2></div>
<button type="button" onclick="loadXMLDoc()">Change Content</button>

</body>
</html>
```

```TXT
<!-- ajax_info.txt -->
<p>Ajax 的全称是 Asynchronous JavaScript and XML（异步的 JavaScript 和 XML），是一种用于创建动态网页的技术。</p>
<p>Ajax 技术指的是脚本独立向服务器请求数据，拿到数据以后，进行处理并更新网页。</p>
```

以上就是 AJAX 通过 XMLHttpRequest 对象向服务器发送请求的介绍内容了，在下一章中，我们将继续学习 XHR 响应。
