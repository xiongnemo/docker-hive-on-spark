#!/bin/bash
service ssh start
sudo -i -u hadoop bash << EOF

if [ -s "/home/hadoop/hdfs_is_initialized" ]
then 
    echo "anzupop:hive: HDFS has already been initialized."
else
    echo "anzupop:hive: Now initializing HDFS."
    /home/hadoop/hadoop/bin/hdfs namenode -format
fi

echo 1 > /home/hadoop/hdfs_is_initialized

echo "anzupop:hive: Starting hdfs ..."
/home/hadoop/hadoop/sbin/start-dfs.sh

echo "anzupop:hive: HDFS status ..."
/home/hadoop/hadoop/bin/hdfs dfsadmin -report

echo "anzupop:hive: Starting yarn..."
/home/hadoop/hadoop/sbin/start-yarn.sh

echo "anzupop:hive: Starting MR-JobHistory Server..."
/home/hadoop/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

echo "anzupop:hive: Starting Spark Master..."
/home/hadoop/spark/sbin/start-master.sh

echo "anzupop:hive: Starting Spark History Server..."
/home/hadoop/spark/sbin/start-history-server.sh

echo "anzupop:hive: Preparing HDFS for hive..."
/home/hadoop/hadoop/bin/hdfs dfs -mkdir -p /tmp
/home/hadoop/hadoop/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/home/hadoop/hadoop/bin/hdfs dfs -chmod g+w /tmp
/home/hadoop/hadoop/bin/hdfs dfs -chmod g+w /user/hive/warehouse

echo "anzupop:hive: Checking Hive Metastore..."
if [ -s "/home/hadoop/hive_metastore_is_initialized" ]
then 
    echo "anzupop:hive: Hive metastore on Postgres has already been initialized."
else
    echo "anzupop:hive: Now initializing Hive metastore."
    /home/hadoop/hive/bin/schematool -dbType postgres -initSchema
fi

echo 1 > /home/hadoop/hive_metastore_is_initialized

echo "anzupop:hive: Starting Hive Metastore..."
/home/hadoop/hive/bin/hive --service metastore &

echo "anzupop:hive: Starting Hive: hiveserver2..."
/home/hadoop/hive/bin/hive --service hiveserver2 &

sleep 1145141919810d
EOF
