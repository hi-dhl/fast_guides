#!/usr/bin/env bash


#--------------------------------------------
# Author:  yeho <lj2007331 AT gmail.com>
# BLOG:  https://blog.linuxeye.com
#
# Notes: OneinStack for CentOS/RadHat 6+ Debian 7+ and Ubuntu 12+
#
# Project home page:
#       https://oneinstack.com
#       https://github.com/lj2007331/oneinstack
#--------------------------------------------

#定义变量
my_name="jack";
my_age="20岁"

#拼接字符串
echo $my_name $my_age
echo $my_name$my_age

#获取字符串长度

echo ${#my_name}
echo ${my_name:0:2}

#查找字符串
echo `expr index "$my_name" name`

