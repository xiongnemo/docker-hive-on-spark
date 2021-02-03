function stopServices {
  echo ">> Stopping Spark Master and slaves ..."
  docker exec docker-hive-on-spark_nodemaster_1 stop-master.sh
  docker exec docker-hive-on-spark_node2_1 stop-slave.sh
  docker exec docker-hive-on-spark_node3_1 stop-slave.sh
  docker exec docker-hive-on-spark_nifi_1 /home/hadoop/nifi/bin/nifi.sh stop
  docker exec docker-hive-on-spark_zeppelin_1 /home/hadoop/zeppelin/bin/zeppelin-daemon.sh stop
  echo ">> Stopping containers ..."
  docker-compose stop
}

stopServices