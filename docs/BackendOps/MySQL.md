### MySQL

#### MYSQL安装配置

##### 安装步骤

1. 下载[社区开源版本](https://downloads.mysql.com/archives/community/)，x86的，按照提示一步步点击按钮即可
2. 安装好后，在 **系统偏好设置** 最下方可以看到MySQL的图标
3. 点进去，看到两个绿点，表示安装成功了

##### 配置

1. `ps -ef | grep mysql`  得到mysql的路径   `--basedir=/usr/local/mysql`  
2. 根目录下执行命令 `open .bash_profile` ，可看到文件内容
3. 添加一行  `export PATH=${PATH}:/usr/local/mysql/bin` ，保存文件
4. 根目录下执行命令  `source .bash_profile` ,让刚才的命令生效
5. `mysql --help` 可查看更多信息

##### 命令行

```bash
➜ ~ mysql --version //查看版本
➜ ~ mysql -u root -p // 进入服务
Enter password:
Welcome to the MySQL monitor.
mysql> show databases; // 查看数据库
mysql> use blog_posts;  // 切换数据库
mysql> show tables; // 查看集合
```

##### MYSQL 指令

```sql
use `blog_posts`; // 要表明操作的数据库

CREATE TABLE posts ( // 注意是小括号包围
  id int not null primary key AUTO_INCREMENT,
  title text not null,
  post_text longtext  not null,
  user_name varchar(100) not null,
  date_posted datetime not null default CURRENT_TIMESTAMP(),
  likes int
) default charset=utf8mb4; // 字符集在末尾指定
// int(n) 这种写法不推荐了，不指定宽度（display width）


use `blog_posts`;
UPDATE posts SET likes = 0 WHERE id=1;
```



#### MySQL：十六进制可以存吗

```sql
insert into blog_posts.posts  values (2, 'title', 'post_text','name', current_timestamp(), 100);

SELECT Hex(likes) FROM blog_posts.posts;

```

#### js🔗数据库代码

```js
// mysql.js
import mysql from 'mysql';
import inquirer from 'inquirer';

const mysql_user = {
  host: 'localhost',
  user: 'root',
  password: '',
};

const connection = mysql.createConnection(mysql_user, {
  multipleStatements: true,
});

module.exports = connection;

function query(query) {
  connection.query(query, (error, result) => {
    if (error) {
      console.log(error);
    } else {
      console.log(result);
    }
    inquire();
  });
}

function inquire() {
  inquirer
    .prompt([
      {
        name: 'statement',
        message: 'mysql>',
      },
    ])
    .then((answer) => {
      if (answer.statement === 'quit') {
        console.log('Disconnected and exit');
        connection.end();
      } else {
        query(answer.statement);
      }
    });
}

function connect() {
  connection.connect((error) => {
    if (error) {
      console.log(error);
    } else {
      console.log('Connected to SQL');
      inquire();
    }
  });
}

connect();
```



#### linux查看MYSQL正在使用的端口号

`lsof -i tcp:3000` [哪个进程在使用该端口]

`kill -9 {PID}` 【terminate结束进程】

#### Mysql存储json格式数据

https://blog.csdn.net/zxl646801924/article/details/123407181

### mongodb

#### mongodb安装配置

##### 安装步骤

 [https://www.bilibili.com/video/BV1wr4y1e7rw]

1. [mongodb.com](http://mongodb.com) 下载社区版本

2. 解压后将文件夹挪到 `/usr/local`目录下,文件夹名为 `mongodb`

3. 根目录下执行命令 `open .bash_profile` ，可看到文件内容

4. 添加一行 `export PATH=${PATH}:/usr/local/mongodb/bin`，保存文件

5. 根目录下执行命令 `source .bash_profile` ,让刚才的命令生效

6. 执行命令 `mongod -version`，跳出版本信息，则安装成功

7. 在官网下载的包里解压后没有存储数据和日志的目录，需要新建

8. 1. 新建目录 `mkdir data log`
   2. 设置文件夹读写权限

##### 开始执行

1. `mongod --fork --dbpath data --logpath log/mongo.log --logappend` 目录需要正确
2. 另起一命令 `mongo`,进入命令行
3. 此时可以通过网页访问 `127.0.0.1:27017`

##### 命令行

```bash
\> show databases // 查看数据库
\> use nft-caution // 切换数据库
switched to db nft-caution
\> show collections  // 查看集合
nft-infos
\> db.createCollection('aa') // 创建集合
{ "ok" : 1 }
\> db.aa.drop() // 删除集合
true

\> db.shutdownServer()  // 关闭mongo服务
shutdown command only works with the admin database; try 'use admin'
\> use admin
switched to db admin
\> db.shutdownServer()
server should be down...
```

#### js中🔗数据库代码

```js
// mongodb.js
// 引入mongoose第三方模块
import mongoose from 'mongoose'

// 0. 连接数据库
const db_url = "mongodb://localhost:27017/nft-caution"
mongoose.connect(db_url, { useNewUrlParser: true, useUnifiedTopology: true })

// 1. 设置回调函数
const db = mongoose.connection;

//2.连接成功
db.on('connected', function () {
  console.log('连接成功：', db_url);
})

//3.连接失败
db.on('error', function (err) {
  console.log('连接错误：', err);
})

//4.断开连接
db.on('disconnection', function () {
  console.log('断开连接');
})
```



#### Linux查看MongoDB的进程

node中连接MongoDB



### 使用Proxyman Postman

#### 方案一：只有 Proxyman 软件

​	本机地址 ( 在ifconfig里的en0 192.168.0.109 )

1. 在 Preferences > General > 设置 覆盖 wall 代理	![image-20220602222744551](/Users/chaochao/Library/Application Support/typora-user-images/image-20220602222744551.png)

2. 第一步中设置好之后，系统偏好设置 >  网络 > 网页代理(HTTP) 和安全网页代理 (HTTPS) >  会自动被覆盖为 `127.0.0.1:9090`  (手动改为 `192.168.0.109` 也成功)
3. localhost 可能会被代理设置忽略， ` http://localhost:3000/` 可能在Proxyman中仍不能抓包成功， 可将 url 改为 `http://192.168.0.109:3000`
4. 不能wall了，因为代理被替换了，网页所有请求都可被抓包。

#### 方案二：Proxyman抓包，用Postman发送请求

 1. Postman中可以设置代理地址，设置为Proxyman监听的地址即可

    Preferences > Proxy > Proxy Server > `192.168.0.109:9090`

 2. Proxyman中的 覆盖 wall 代理 的设置可以取消了。

     系统偏好设置里的代理会自动去掉勾选项。

 3. 这样只有Postman的请求可以被抓包，网页不会被抓包，可以 wall 。


