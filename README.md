# 10分钟入门Shell脚本编程

## 前言

写下这篇文章，是对自己在学习和使用过程中的总结，文笔不是很好，如果有什么问题欢迎沟通交流 

## Shell是什么

Shell是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务, Shell脚本（shell script），是一种为Shell编写的脚本程序。我们经常说的shell通常都是指shell脚本。

## 环境和工具

Shell跟java、php、Python编程一样，只要有一个能编写代码的文本编辑器和一个能解释执行的脚本解释器就可以了。

Mac OS，Linux 自带了shell解释器，Windows比较麻烦，因为Win7专业版和旗舰版默认安装PowerShell，标准版和家庭版中就没有安装的，为了方便建议安装cygwin

## PHP、Python 也可以作为Shell编程

PHP、Python是属于高级编程语言，但是也可以做Shell编程，因为只要有解释器，也可以用作脚本编程

如下是一个Python Shell Script示例（假设文件名叫op\_python\_base.py）：

```
#!/usr/bin/env python3 //告诉Python从系统环境中找python
# -*- coding: utf-8 -*- //设置为UTF-8编码

for index in range(10):
    print(index);
```

源码：[op\_python\_base](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_python_base.py)

如下是一个PHP Shell Script示例（假设文件名叫op\_php\_base.php）：

```
#!/usr/bin/php
<?php

for($i=0 ;$i<10; $i++){
    echo $i;
}

?>
```

源码：[op\_php\_base](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_php_base.php)

## 为什么要学习Shell

既然PHP、Python都可以用来写脚本编程，那为什么还要学习陌生、晦涩难懂的Shell，主要有一下几个原因

* 环境兼容性，Win7专业版和旗舰版默认安装PowerShell，标准版和家庭版中就没有安装的，其他主流的操作系统都预制了Shell解释器，所以使用sh、bash编写，提供给其他人使用是非常方便的，但是PHP、Python 等等需要安装相应的环境

* 如果你想做一些定时任务比如说检测进程是否存在，自动备份，或者说自动部署环境、服务器之间的数据同步等等sh、bash会是你最好的选择

## sh与bash

sh: Bourne shell，POSIX（Portable Operating System Interface）标准的shell解释器，它的二进制文件路径通常是/bin/sh

bash: Bash是Bourne shell的替代品，属GNU Project，二进制文件路径通常是/bin/bash

## 第一个shell脚本

### 我们先来看一个例子

我相信写过代码的童鞋，应该对下面的代码很熟悉并不陌生，（假设文件名叫op\_base.sh）：

```
#!/usr/bin/env bash
mkdir code
cd  code
for ((i=0; i<3; i++)); do
    touch test_${i}.txt
    echo "shell很简单" >> test_${i}.txt
done
```

第一行：从系统path中寻找指定脚本的解释程序  
第二行：创建 名叫code文件夹  
第三行：进入创建的文件夹  
第四行：for循环3次  
第四行：创建文件  
第五行：往创建的文件中写入信息  
第六行：结束循环

mkdir, touch，cd，touch，echo都是系统命令，在命令行下可以直接执行  
for, do, done 是shell脚本语言 for循环的语法

源码：[op\_base.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_base.sh)

### 编写Shell

新建一个文件，扩展名为sh（sh代表shell），扩展名并不影响脚本执行，见名知意就好，如果你用php，扩展名为php，如果你用Python，扩展名为python

第一行一般是这样：

```
#!/usr/bin/php
#!/usr/bin/env python3
#!/usr/bin/env bash
```

# !”是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行

```
/env 是系统的PATH目录中查找
```

### 运行 Shell 脚本有两种方法：

#### 作为可执行程序

```
chmod +x op_base.sh
./op_base.sh
```

第一行设置 op\_base.sh可执行权限  
第二行执行op\_base.sh

#### 作为参数

```
/bin/sh op_base.sh
```

### 变量

定义变量时，变量名前不需要加符号和Python一样但是在PHP语言中变量需要加$，如：

```
my_name="jack"
my_name='jack';
```

ps: 变量名和等号之间不能有空格,变量后面不能有;

Shell中的引号和PHP类似，字符串可以用单引号，也可以用双引号

单引号字符串的限制：

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
* 单引号字串中不能出现单引号（对单引号使用转义符后也不行

双引号：

* 双引号里可以有变量
* 双引号里可以出现转义字符

但是在Python中单引号和双引号是没有区别，但是Python 还有三个引号，在三个引号内字符都不会被转义

### 使用变量

对于已经定义过的变量，使用的适合在前面添加$

```
echo $my_name
echo ${my_name}
```

变量名外面的花括号是可选的，加不加都行,建议使用第二种形式

### 注释

以“\#”开头的行就是注释，会被解释器忽略。

#### 多行注释

sh里没有多行注释，只能每一行加一个\#号。就像这样：

```
#--------------------------------------------
# Author:  jack 
# weibo: OO是有情怀的PM
#
# Notes: 10分钟入门Shell脚本编程
#
# Project home page:
#       https://github.com/dpm100/fast_guides
#--------------------------------------------
```

### 字符串

字符串可以用单引号，也可以用双引号，也可以不用引号。单双引号的区别跟PHP类似

Shell不像其他语言有php、python 有很多数据类型，在Shell中常用的数据类型字符串数字和字符串（ps: 除了数字和字符串，也没啥其它类型好用了，哈哈）

单引号字符串的限制：

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
* 单引号字串中不能出现单引号（对单引号使用转义符后也不行

双引号：

* 双引号里可以有变量
* 双引号里可以出现转义字符

### 字符串操作

#### 拼接字符串

```
my_name="jack";
my_age="20岁"
echo $my_name $my_age
echo $my_name$my_age
```

#### 获取字符串长度

```
echo ${#my_name}
```

#### 截取字符串

```
echo ${my_name:0:2}
```

源码：[op\_str.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_str.sh)

### Shell 数组

#### 定义数组

在Shell中，用括号来表示数组，数组元素用"空格"符号分割开。定义数组的一般形式为：

```
name=(name1 name2 name3)
```

还可以单独定义数组的各个分量：

```
ary[0]=name1
ary[1]=name2
ary[3]=name3
```

ps: 可以不使用连续的下标，而且下标的范围没有限制

#### 读取数组

读取数组元素值的一般格式是：

```
${数组名[下标]}
```

例如：

```
echo ${name[0]}
```

使用@符号可以获取数组中的所有元素，例如：

```
echo ${name[@]}
```

#### 获取数组的长度

获取数组长度的方法与获取字符串长度的方法相同，例如：

```
# 取得数组元素的个数
length=${#name[@]}
echo $length

# 或者
length=${#name[*]}
echo $length

# 取得数组单个元素的长度
lengthn=${#name[n]}
echo $length
```

源码：[op\_arry.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_arry.sh)

### Shell 流程控制

和Java、PHP、Python等语言不一样，sh的流程控制不可为空，如\(以下为PHP流程控制写法\)：

```
<?php
if (isset($_GET["q"])) {
    search(q);
}
else {
    // 不做任何事情
}
```

在sh/bash里可不能这么写，如果else分支没有语句执行，就不要写这个else

#### if

```
if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi
```

例子：

```
#!/usr/bin/env bash

a=1
b=2
if [ $a == $b ]
    then
        echo "a 等于 b"
 elif [ $a -gt $b ]
    then
        echo "a 大于 b"
 elif [ $a -lt $b ]
    then
        echo "a 小于 b"
 else
    echo "没有符合的条件"

 fi
```

源码：[op\_if.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_if.sh)

#### for 循环

Shell的for循环和Python 有点类似

##### Python的for循环

```
for index in 1,2,3,4,5:
    print(index);
```

##### Shell的for循环，第一种写法

```
for index in 1 2 3 4 5; do
    echo "index="$index
done
```

##### Shell的for循环，第二种写法

```
for ((i=0; i<5; i++)); do
    echo "i="$i
done
```

源码：[op\_for.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_for.sh)

#### while 语句

while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。

```
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
```

源码：[op\_while.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/op_while.sh)

### Shell结合系统命令

sh脚本结合系统命令便有了强大的威力，在字符处理领域，有grep、awk、sed三剑客，grep负责找出特定的行，awk能将行拆分成多个字段，sed则可以实现更新插入删除等写操作。

#### 例如定时检测nginx、mysql是否被关闭

    path=/var/log
    log=${path}/httpd-mysql.log

    name=(apache mysql)

    exs_init[0]="service httpd start"
    exs_init[1]="/etc/init.d/mysqld restart"

    for ((i=0; i<2; i++)); do
        echo "检查${name[i]}进程是否存在"
        ps -ef|grep ${name[i]} |grep -v grep
        if [ $? -eq 0 ]; then
            pid=$(pgrep -f ${name[i]})
            echo "`date +"%Y-%m-%d %H:%M:%S"` ${name[$i]} is running with pid $pid" >> ${log}
         else
            $(${exs_init[i]})
            echo "`date +"%Y-%m-%d %H:%M:%S"` ${name[$i]} start success" >> ${log}
        fi
    done

解释：检测 nginx、mysql进程是否存在，如果不存在了会自动重新启动。  
脚本每次运行会写日志的，没事可以去看看该日志文件，如果进程是不是真的经常性不存在，恐怕就要排查一下深层原因了。

源码：[check\_nginx.sh](https://github.com/dpm100/fast_guides/blob/master/fast-shell/check_apache_mysql.sh)

#### 编辑 /etc/crontab 文件

```
crontab -e
```

在文件最后添加一行：

```
*/5 * * * * /xxx/check_nginx.sh > /dev/null 2>&1
```

上表示每 5 分钟，执行一下脚本 /xxx/check\_nginx.sh，其中xxx代表路径

/dev/null 2&gt;&1 的意思是该条shell命令将不会输出任何信息到控制台，也不会有任何信息输出到文件中。

```
# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * command to be executed
```

### 添加完配置，需要重启才能生效

```
service crond restart
```



