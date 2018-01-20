#!/usr/bin/env bash

# for循环的第一种写法

for index in 1 2 3 4 5; do
    echo "index="$index
done

# for循环的第二种写法

for ((i=0; i<5; i++)); do
    echo "i="$i
done