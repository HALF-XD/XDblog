#### Linux 命令

```bash
# 查看文件
cat 文件名 # 由第一行开始显示内容，并将所有内容输出
cat aa.py| cut -d: -f2 > aaa.py
cat aa.py | awk '{print $1}' > bbb.py
# history
history | grep map | tail -20 # [grep map]含有关键字map # [tail -20]最近20条历史记录
find . -name "*filename*" # 查找文件
# 查找文件夹
------------------------------
mv  # move挪
------------------------------
chmod a+w /usr/local/lib/node_modules # 修改文件权限
------------------------------
ln 为某个文件在另一个位置建立一个同步的链接 # ln 链接
ln -s source target 【目标文件可 ls -l查看】【s - symbol】
ln -s a.out printargv
------------------------------
scp  # secure copy linux 系统下基于 ssh 登陆进行安全的远程文件拷贝命令
scp [-r] localFile user@xxx.xxx.xx:/
# scp new_fun.py root@192.168.2.1:/root  # 回车输入密码
scp  -r  root@192.168.2.1:/opt/dawa   ~/Desktop # 将指定服务器上代码拿到本地文件夹
------------------------------
cp -r webeval_bak ~/Desktop/core_web # 目录中的所有文件及其子目录拷贝到另一目录中
------------------------------
lsof -iTCP -sTCP:LISTEN -n -P # 查看监听端口号
------------------------------
ps #进程相关
ps -ef  # 显示所有进程信息，连同命令行
ps -ef | grep ssh # 与grep常用组合用法 查看特定进程
------------------------------
tcpdump -nn -x -i eth0 port 80 # 连接
# (-tcpdump:yum apt-get)
# (-nn:不显示HTTP明文)
# (-i:interface 网卡)
------------------------------
# nc - net contact
nc www.baidu.com 80
# (连接)走的是http协议

# 例子，查看80端口的占用情况：
lsof -i:80
#或者：
netstat -apn | grep 80
# 上面的命令执行之后可以显示进程号，找到进程号以后，再使用以下命令查看详细信息：
ps -aux | grep <进程号>
# 进程相关
------------------------------
# linux命令中压缩文件
tar -zcf back-up.tar.gz learn  # tar -zcf "name".tar.gz  "被打包文件夹名"
tar -zxf back-up.tar.gz  # tar -zxf "name”.tar.gz
------------------------------
nslookup  # 常用域名查询(DNS信息)
------------------------------
curl  # curl 是常用的命令行工具，用来请求 Web 服务器
tail -f # tail -f filename会把filename里最尾部的内容显示在屏幕上，并且不断刷新，使你看到最新的文件内容。
wget （address完整域名地址）# 下载文件到目录
echo
awk / cut
```

##### 解压文件：

总结

```bash
1、*.tar 用 tar –xvf 解压
2、*.gz 用 gzip -d或者gunzip 解压
3、*.tar.gz和*.tgz 用 tar –xzf 解压
4、*.bz2 用 bzip2 -d或者用bunzip2 解压
5、*.tar.bz2用tar –xjf 解压
6、*.Z 用 uncompress 解压
7、*.tar.Z 用tar –xZf 解压
8、*.rar 用 unrar e解压
9、*.zip 用 unzip 解压
```

##### netstat

显示与 IP、TCP、UDP 和 ICMP 协议相关的统计数据，一般用于检验本机各端口的网络连接情况。
`netstat` 是在内核中访问网络及相关信息的程序，它能提供 TCP 连接，TCP 和 UDP 监听，进程内存管理的相关报告。

```bash
netstat -natp # 套接字 网络状态
# host+port:ip+port 唯一表示四元组
# (host 主机)
# (port 进程程序65535)

# netstat - network statistics
# netstat ntlp
# netstat nap(number all process) | grep
# netstat natp

显示与 IP、TCP、UDP 和 ICMP 协议相关的统计数据，一般用于检验本机各端口的网络连接情况
netstat -a  # 列出所有端口
netstat -nu # 显示当前 UDP 连接状况
netstat -apu # 显示 UDP 端口号的使用情况
netstat -i # 显示网卡列表
```

#### Nginx

一、安装

(1) 安装 Homebrew

macOS 缺失的软件包的管理器，安装方法参考官网。（可能被墙）

(2) 安装 nginx `brew install nginx`

先更新 homebrew、再安装 nginx 依赖包、再安装 nginx，大约等待几分钟。

二、启动 ` nginx`

在浏览器中查看

三、查看/终止进程

nginx 在启动后，在 unix 系统中会以 daemon（守护进程）的方式在后台运行，后台进程包含一个 master 进程和多个 worker 进程。

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
