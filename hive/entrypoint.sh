#!/bin/bash
service ssh start
# su hadoop

if [ -s "/hdfs_is_initialized" ]
then 
    echo "anzupop:hive: HDFS has already been initialized."
else
    echo "anzupop:hive: Now initializing HDFS."
    hdfs namenode -format
fi

echo 1 > /hdfs_is_initialized

echo "anzupop:hive: Starting hdfs ..."
/home/hadoop/hadoop/sbin/start-dfs.sh

echo "anzupop:hive: Starting yarn..."
/home/hadoop/hadoop/sbin/start-yarn.sh

echo "anzupop:hive: Starting MR-JobHistory Server..."
/home/hadoop/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

echo "anzupop:hive: Starting Spark Master..."
/home/hadoop/spark/sbin/start-master.sh

echo "anzupop:hive: Starting Spark History Server..."
/home/hadoop/spark/sbin/start-history-server.sh

echo "anzupop:hive: Preparing HDFS for hive..."
hdfs dfs -mkdir -p /tmp
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse

echo "anzupop:hive: Checking Hive Metastore..."
if [ -s "/hive_metastore_is_initialized" ]
then 
    echo "anzupop:hive: Hive metastore on Postgres has already been initialized."
else
    echo "anzupop:hive: Now initializing Hive metastore."
    schematool -dbType postgres -initSchema
fi

echo 1 > /hive_metastore_is_initialized

echo "anzupop:hive: Starting Hive Metastore..."
hive --service metastore &

echo "anzupop:hive: Starting Hive: hiveserver2..."
hive --service hiveserver2 &

sleep 1145141919810d
