#!/bin/bash
service ssh start
sudo -i -u hadoop bash << EOF
echo "anzupop:spark: Starting Spark Slave..."
/home/hadoop/spark/sbin/start-slave.sh nodemaster:7077
sleep 1145141919810d
EOF
