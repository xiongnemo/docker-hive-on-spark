#!/bin/bash
service ssh start
sudo -i -u hadoop bash << EOF
echo "anzupop:nifi: Starting Zeppelin..."
/home/hadoop/zeppelin/bin/zeppelin-daemon.sh start
sleep 1145141919810d
EOF
