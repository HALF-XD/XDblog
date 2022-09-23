<!-- ## 计算机网络 Computer Network  -->

#### HTTP status code

<details>
<summary>504</summary>
**Gateway Timeout**
网关/代理服务器未在时间内获得应有的响应。
</details>

<details>
<summary>304</summary>
<p>
123123
</p>
</details>

#### TCP/IP

<details style="border:1px solid red;padding:10px"><summary>TCP 含义</summary>
TCP
  Transmission Control Protocol 传输控制协议
  面向连接、可靠、基于字节流的单播协议
  在传输层的协议
高并发负载均衡  集群 -> 前置理论
io模型 内核给程序暴露API源自socket
分布式 微服务 服务网格 大数据 云计算
</details>

<details style="border:1px solid red;padding:10px"><summary>TCP/IP 的 三次握手四次挥手</summary>

- 过程？画出示意图？
  <img src="./images/三次握手四次挥手.png" width="80%">
- 状态，
  Closed, Listen, Establish
  SYN, SYN-SEND, SYN-RCVD
  ACK, seq, ack

- 为什么连接三次握手？
- 什么是半连接队列？
- 为什么客户端最后还要等待 2MSL？

</details>

<details><summary>  </summary>
<pre>
</pre>
</details>

#### OSI 7 层模型

- 应用层
  - 解释：网络服务与最终用户的一个接口。
  - 协议有：HTTP FTP TFTP SMTP SNMP DNS TELNET HTTPS POP3 DHCP
- 表示层
  - 解释：数据的表示、安全、压缩。
  - 协议有：
- 会话层
  - 解释：建立、管理、终止会话。
  - 协议有：
- 传输控制层
  - 解释：定义传输数据的协议端口号，以及流控和差错校验。
  - 协议有：TCP UDP。数据包一旦离开网卡即进入网络传输层
- 网络层
  - 解释：进行逻辑地址寻址，实现不同网络之间的路径选择。IP 选址及路由选择。
  - 协议有：IP ICMP RIP IGMP（IPV4 IPV6）
- 数据链路层
  - 解释：建立逻辑连接、进行硬件地址寻址、差错校验等功能。
    将比特组合成字节进而组合成帧，用 MAC 地址访问介质，错误发现但不能纠正。
  - 协议有：ARP RARP PPP IEEE802.3 CSMA/CD
- 物理层
  - 解释：建立、维护、断开物理连接。
  - 协议有：
