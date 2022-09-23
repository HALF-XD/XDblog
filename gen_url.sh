#!/bin/bash

function ergodic(){
  for file in `ls $1` # 注意：此处这是两个反引号，表示运行系统命令
  do
    if [ -d $1"/"$file ] # 注意：此处之间一定要加上空格，否则会报错
    then
      echo "- "$file
      ergodic $1"/"$file
    else
      local path=$1"/"$file 
      local name=$file      
      echo "  - ["$name"]("$path")"
    fi
  done
}
IFS=$'\n' # 这个必须要，否则会在文件名中有空格时出错
INIT_PATH=".";
ergodic $INIT_PATH

# 执行文件： 当前目录下：
# chmod +x ./gen_url.sh  #使脚本具有执行权限