#!/bin/bash

# generate ssh key
echo "Y" | ssh-keygen -t rsa -P "" -f ./base/keys/id_rsa

# Java base build
docker build -f ./base/Dockerfile . -t anzupop/spark_hive_cluster:base && \

# Hadoop build
docker build -f ./hadoop/Dockerfile . -t anzupop/spark_hive_cluster:hadoop && \

# Spark
docker build -f ./spark/Dockerfile . -t anzupop/spark_hive_cluster:spark && \

# PostgreSQL Hive Metastore Server
docker build -f ./postgresql-hms/Dockerfile . -t anzupop/spark_hive_cluster:postgresql-hms && \

# Hive
docker build -f ./hive/Dockerfile . -t anzupop/spark_hive_cluster:hive && \

# Nifi
docker build -f ./nifi/Dockerfile . -t anzupop/spark_hive_cluster:nifi && \

# Edge
docker build -f ./edge/Dockerfile . -t anzupop/spark_hive_cluster:edge && \

# hue
docker build -f ./hue/Dockerfile . -t anzupop/spark_hive_cluster:hue && \

# zeppelin
docker build -f ./zeppelin/Dockerfile . -t anzupop/spark_hive_cluster:zeppelin
