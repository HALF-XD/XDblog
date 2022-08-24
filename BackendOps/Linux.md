#### Linux

##### history

```bash
history | grep map | tail -20

[grep map]含有关键字map
[tail -20]最近20条历史记录
```

##### 修改文件权限

```bash
chmod a+w /usr/local/lib/node_modules
```

##### ln 链接

```bash
ln 为某个文件在另一个位置建立一个同步的链接
ln -s source target 【目标文件可 ls -l查看】【s - symbol】
ln -s a.out printargv 
```

#### Nginx

一、安装

(1) 安装 Homebrew

 macOS 缺失的软件包的管理器，安装方法参考官网。（可能被墙）

(2) 安装nginx  `brew install nginx`

 先更新homebrew、再安装nginx依赖包、再安装nginx，大约等待几分钟。

二、启动 ` nginx`

 在浏览器中查看

三、查看/终止进程

nginx在启动后，在unix系统中会以daemon（守护进程）的方式在后台运行，后台进程包含一个master进程和多个worker进程。 

```bash
ps -ef | grep nginx 查看进程
kill -9 进程号 终止进程
```

四、常用命令

```bash
nginx -v 查看版本
nginx -h 显示帮助

// -s 表示signal，向主进程发信号：stop、quit、reopen、reload
nginx -s quit  优雅关闭（先服务完已打开的连接）
nginx -s stop 快速关闭

quit和stop都会停止nginx（使用ps -ef | grep nginx，会发现已没有主进程、工作进程），   
brew list nginx 可以查看nginx等相关文件的路径
```

报错信息：

```bash
nginx: [emerg] cannot load certificate "/etc/ssl/test/cert.pem": BIO_new_file() failed (SSL: error:02001002:system library:fopen:No such file or directory:fopen('/etc/ssl/test/cert.pem','r') error:2006D080:BIO routines:BIO_new_file:no such file)
```

证书路径问题



#### 虚拟机

ubuntu

```bash
try ubuntu
install ubuntu
```

