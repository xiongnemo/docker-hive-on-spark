#!/bin/bash
service ssh start
# su hadoop
echo "anzupop:edge: Starting Zookeeper..."
/home/hadoop/kafka/bin/zookeeper-server-start.sh -daemon  /home/hadoop/kafka/config/zookeeper.properties
echo "anzupop:edge: Starting Kafka..."
/home/hadoop/kafka/bin/kafka-server-start.sh -daemon  /home/hadoop/kafka/config/server.properties
sleep 1145141919810d