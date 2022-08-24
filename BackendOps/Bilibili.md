#### B站视频下载

下载视频

```shell
you-get https://www.bilibili.com/video/xxxxxx
you-get https://www.bilibili.com/video/xxxxxx\?p=1 --playlist
```

删除弹幕

```shell
rm *.cmt.xml
```

修改格式

```bash
find . -name '*.flv' -exec ffmpeg -i {} bak/{}.mp4 \;
```

#### B站视频倍速播放

控制台输入

```js
document.querySelector('video').playbackRate = 2.5 // 数字可更改
```



