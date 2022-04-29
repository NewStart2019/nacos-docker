#!/bin/bash

echo "准备阶段……"
base=/docker/redis
mkdir $base/700{1..6}
mkdir $base/700{1..6}/data
mkdir $base/700{1..6}/config
cp redis.conf /docker/redis/700{1..6}/config/redis.conf


echo "创建容器……"
docker-compose -f redis-cluster.yml up -d

echo "请手动指定集群的分布，使用\n\tdocker exec -it redis1 reddis-cli --cluster create --cluster-replicas 0 host:ip"