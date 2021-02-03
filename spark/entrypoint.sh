#!/bin/bash
service ssh start
# su hadoop
echo "anzupop:spark: Starting Spark Slave..."
/home/hadoop/spark/sbin/start-slave.sh nodemaster:7077
sleep 1145141919810d
