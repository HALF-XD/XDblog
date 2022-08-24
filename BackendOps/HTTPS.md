#### 创建HTTPS网站

- 域名备案
- DNS验证\文件验证
- nginx搭建web服务器 状态：
- 服务器IP ：47.52.138.194 解析域名[www.mkroot.com](applewebdata://601F0805-D3FC-4D17-8699-FC8B73CA0624/www.mkroot.com)
- 已签发SSL证书，有效期至2021年8月3日

登录服务器：ssh root@47.52.138.194

证书

#### 代理的原理

shadowsocks

A发出http请求=> B(代理) => c（服务器）

A （APP）=>socks代理(流，长链接)/HTTP代理=>shadowsocks 打包【加密+请求】=> B

B （47.100.222.137：8392）【加密】确认=>接受A请求=>

B  请求转发给C=>（）

自动代理/全局代理

端口

接受请求（建立连接） 

