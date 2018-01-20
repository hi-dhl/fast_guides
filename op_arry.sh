#!/usr/bin/env bash

name=(name1 name2 name3)

ary[0]=name1
ary[1]=name2
ary[3]=name3

#获取数据所有元素
echo ${name[@]}

# 取得数组元素的个数
length=${#name[@]}
echo $length

# 或者
length=${#name[*]}
echo $length

# 取得数组单个元素的长度
lengthn=${#name[n]}
echo $length
