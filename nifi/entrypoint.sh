#!/bin/bash
service ssh start
sudo -i -u hadoop bash << EOF
echo "anzupop:nifi: Starting nifi..."
/home/hadoop/nifi/bin/nifi.sh start
sleep 1145141919810d
EOF
