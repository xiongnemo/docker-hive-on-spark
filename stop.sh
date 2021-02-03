function stopServices {
  echo ">> Stopping Spark Master and slaves ..."
  docker exec docker_hive_nodemaster_1 stop-master.sh
  docker exec docker_hive_node2_1 stop-slave.sh
  docker exec docker_hive_node3_1 stop-slave.sh
  docker exec docker_hive_nifi_1 /home/hadoop/nifi/bin/nifi.sh stop
  docker exec docker_hive_zeppelin_1 /home/hadoop/zeppelin/bin/zeppelin-daemon.sh stop
  echo ">> Stopping containers ..."
  docker-compose stop
}

stopServices