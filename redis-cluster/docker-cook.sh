#!/bin/bash
#
# 此脚本作用是快速创建一个redis集群
#
# ./docker-cook.sh run

# def env
BIND_IP='172.22.1.11'

if [ "$1" = 'run' ];then
 for ind in `seq 1 6`; do \
  docker run -d \
  -v $PWD/cluster-config.conf:/usr/local/etc/redis/redis.conf \
  -v $PWD/data/r$ind:/data \
  --name "jinhua-river-redis-$ind" \
  --net host \
  --restart=always \
  redis redis-server /usr/local/etc/redis/redis.conf \
  --port 637$ind \
  --bind $BIND_IP; \
 done
elif [ "$1" = 'rm' ];then
 for ind in `seq 1 6`; do echo -n 'jinhua-river-redis-'"$ind ";done | xargs docker rm -v -f
else
	echo 'docker-cook.sh run'
	echo 'docker-cook.sh rm'
fi

