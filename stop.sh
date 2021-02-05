function stopServices {
  echo ">> Stopping Spark Master..."
  docker-compose exec -u hadoop nodemaster stop-master.sh
  echo ">> Stopping Spark slaves..."
  docker-compose exec -u hadoop node2 stop-slave.sh
  docker-compose exec -u hadoop node3 stop-slave.sh
  echo ">> Stopping Nifi..."
  docker-compose exec -u hadoop nifi /home/hadoop/nifi/bin/nifi.sh stop
  echo ">> Stopping Zeppelin..."
  docker-compose exec -u hadoop zeppelin /home/hadoop/zeppelin/bin/zeppelin-daemon.sh stop
  echo ">> Stopping containers ..."
  docker-compose stop
}

stopServices