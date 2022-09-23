- [网络协议之 TCP/HTTP](https://www.cnblogs.com/ImBit/p/5513401.html)
- [计算机网络基础知识总结](https://www.cnblogs.com/maybe2030/p/4781555.html)
- [计算机网络常用知识总结！](https://mp.weixin.qq.com/s/NKyp-WgGkor-8k3-RP4Ynw)
- [三元博客](https://sanyuan0704.top/blogs/net/http/001.html)

采用 HTTP 协议时，协议方案就是 http 还有 ftp/mailto/telnet/file 等。

绝对 URI 的格式：
http://user:pass@www.example.jp:80/dir/index.htm?uid=1#ch1

协议方案名--登录信息[认证]-----服务器地址-------服务器端口号---带层次的文件路径---查询字符串--片段标识符

【常见的通信】
=> HTTP/HTTPS
=> IP/UDP
=> websocket
【常见的响应方式和状态码】
=> json
=> XML
=> 1XX 2XX 3XX
【ajax 通信】
【restful 风格接口】
【rpc 风格】->GraphQL（拓展）】
【postman】调试接口
【mock 数据】
=> 简单、数据类型丰富、方便扩展

15、讲解浏览器输入 url 到显示过程
16、DNS 解析
17、TCP 三次握手原理及为什么是三次
18、握手失败如何处理
19、TCP 四次挥手原理及为什么是四次
20、http 和 https 的区别
21、TCP 和 UDP 的区别
22、对称加密和非对称加密
23、常用状态码
24、CSRF 和 XSS 攻击
25、Cookie、localstorage、sessionStorage
26、http 请求方法
27、GET: 获取资源

- POST: 传输实体的主体
- PUT: 更新资源，PUT 通常指定了资源的存放位置，而 POST 则没有，POST 的数据存放位置由服务器自己决定。
- DELETE: 删除文件
- HEAD: 获取报文首部，HEAD 和 GET 本质是一样的，区别在于 HEAD 不含有呈现数据，而仅仅是 HTTP 头部信息，例如 url 的有效性以及更新的日期时间。
- OPTIONs: 请求 web 服务器告知其支持的各种功能。可以询问服务器通常支持哪些方法，或者对某些特殊资源支持哪些方法。
- TRACE: 追踪路径，将之前的请求通信返回给客户端
- CONNECT: 要求用隧道协议连接代理，一般为 TLS 和 SSL
  28、Get 和 Post 的区别
  什么是 http 的协议？
  三次握手中，服务器发送 ACK+SYN 包给客户端的时候做了什么事情？
  线程和进程有什么区别？
  手写一个单向链表？
  常见的状态码 301 和 302 和 303 有什么区别？
