#!/bin/bash
service ssh start
sudo -i -u hadoop bash << EOF
echo "anzupop:nifi: Starting Zeppelin..."
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=python3
export ZEPPELIN_PYTHON=python3
/home/hadoop/zeppelin/bin/zeppelin-daemon.sh start
sleep 1145141919810d
EOF
