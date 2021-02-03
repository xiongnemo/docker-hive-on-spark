function stopServices {
  echo ">> Stopping Spark Master and slaves ..."
  docker-compose exec dnodemaster stop-master.sh
  docker-compose exec node2 stop-slave.sh
  docker-compose exec node3 stop-slave.sh
  docker-compose exec nifi /home/hadoop/nifi/bin/nifi.sh stop
  docker-compose exec zeppelin /home/hadoop/zeppelin/bin/zeppelin-daemon.sh stop
  echo ">> Stopping containers ..."
  docker-compose stop
}

stopServices