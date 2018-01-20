#!/usr/bin/env bash

# for循环的第一种写法

int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done