#!/bin/bash
#
# 此脚本作用是创建一个容器执行创建redis集群
#
# redis-cm.sh create
# redis-cm.sh check

# def
S_REDIS='create --replicas 1 '
IPS=`for i in {1..6}; do echo "172.22.1.11:637"$i; done | xargs`

if [ "$1" = 'create' ];then
        docker run -i --name redis-c --rm defyasdf/redis-c:latest $S_REDIS $IPS
elif [ "$1" = 'check' ];then
        docker run -i --name redis-c --rm defyasdf/redis-c:latest check `echo $IPS | awk '{print $1}'`
elif [ "$1" = 'bash' ];then
        docker exec -it redis-1 redis-cli -c -h 172.22.1.11 -p 6371
else
        echo 'redis-cm.sh create'
        echo 'redis-cm.sh check'
        echo 'redis-cm.sh bash'
fi

