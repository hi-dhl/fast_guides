#!/usr/bin/env bash

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
