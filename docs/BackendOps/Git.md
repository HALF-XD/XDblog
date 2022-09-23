##### 未读文章

- [Oh Shit, Git!?!](https://ohshitgit.com/zh) 尴尬场景里的修复方案
- [On undoing, fixing, or removing commits in git](http://sethrobertson.github.io/GitFixUm/fixup.html) 复杂场景
- [git 常用的命令](https://blog.csdn.net/weixin_35792271/article/details/112407323)

##### 网友经验之谈

- `git commit --amend` 的确好用。我之前都是 `git reset --soft` ,然后重新提交的

- 温馨提示，如果你在多人协作的环境里面，在需要使用到强制推送 (`--force`) 时，你应该优先使用 `--force-with-lease` 来代替。直接使用 `--force` 时，如果其他协作成员已经推送了新的提交，就会导致这段内容丢失，而使用 `--force-with-lease` 的时遇到这种情况，就会拒绝你的推送，避免一发自信的 `--force` 把别人内容搞掉了。

- 团队不建议使用 `submodule` ，容易混乱，子模块里面 `.git` 文件需要删除才能，

##### 未整理

```bash
git status -s
 # s --> short 更精简

git chcekout --file
# 分三种情况
# （1）未使用 git add 缓存代码时；
# （2）已使用 git add 缓存了代码；
# （1）已使用 git commit 提交了代码；
```

##### 查看当前 git 环境所有配置

```shell
 git config --list
```

##### 设置 git 的 username 和 email

```shell
git config --global user.name "name"
git config --global user.email "email"
```

##### `.gitignore`文件

```
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.
```

##### github 查看源地址

```shell
git remote -c
```

##### github 配置 SSH Key

1. 检查是否存在 SSH key

```shell
# MacOS里，
cd # 回到根目录
cd .ssh # 测试是否有.ssh这个目录
```

2. 若不存在则配置

```bash
# -t 后为生成的文件名 id_xxx.pub
ssh-keygen -t rsa -C "youremail"
```

3. id_rsa.pub 文件的公钥复制在 github 的 SSH keys 配置里

```shell
cat id_rsa.pub
```

4. 在 github 配置中将公钥内容粘贴 [Settings > SSH and GPG keys > New SSH Key]

5. 检测是否成功配置

```shell
> ssh -T git@github.com
Hi HALF-XD! You've successfully authenticated, but GitHub does not provide shell access.
```

##### github 设置快捷键

编辑 `~/.gitconfig` 文件 ,加入以下部分：

```
[alias] co = checkout
```

命令行：

```bash
git config --global alias.st status
```

##### gh-pages

```shell
https://github.com/gitname/react-gh-pages
```

实验版本

```tex
// 环境
node -v : v16.14.0
npm -v : 8.3.1
git --version : git version 2.16.2
github账户

// 开始操作
npx create-react-app my-app
cd my-app
npm install gh-pages --save-dev
```

##### SSL_connect 443 连接问题

把代理设置一下，下方的 HTTP 代理命令。如果还不行，要看 github 的代理也设置一下试试。

```
export http_proxy=http://127.0.0.1:10818;export https_proxy=http://127.0.0.1:10818;
```

##### github 的 https ssh 区别

https：443 端口，用户名密码授权，速度较快，利于匿名访问，适合开源项目

ssh：22 端口，本地生成 SSH 秘钥对再上传公钥，速度较慢，不利于匿名访问，适合内部项目
