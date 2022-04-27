#!/bin/bash

echo "准备阶段……"
base_dir=/docker/redis
mkdir -p $base_dir/700{1..6}/data
mkdir $base_dir/700{1..6}/config
touch $base_dir/700{1..6}/config/redis.config

cp redis.conf /docker/redis/7001/config
cp redis.conf /docker/redis/7002/config
cp redis.conf /docker/redis/7003/config
cp redis.conf /docker/redis/7004/config
cp redis.conf /docker/redis/7005/config
cp redis.conf /docker/redis/7006/config


echo "创建容器……"
docker-compose -f redis-cluster.yml up -d

redis-cli -h 124.221.109.245 -p 7001 --cluster create  --cluster-replicas 1 \
	124.221.109.245:7001 124.221.109.245:7002 \
	124.221.109.245:7003 124.221.109.245:7004 \
	124.221.109.245:7005 124.221.109.245:7006