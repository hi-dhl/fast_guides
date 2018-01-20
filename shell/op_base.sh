#!/usr/bin/env bash

mkdir code
cd  code
for ((i=0; i<3; i++)); do
    touch test_${i}.txt
    echo "shell很简单" >> test_${i}.txt
done
