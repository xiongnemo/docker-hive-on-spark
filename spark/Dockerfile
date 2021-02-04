FROM anzupop/spark_hive_cluster:hadoop

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# installing python for pyspark
# change python version as per your requirement
RUN apt install -y python python3 python3-pip python-pip-whl

# get scala sources
RUN mkdir /usr/share/scala && \
    wget https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.tgz -P /tmp/ && \
    tar -xzf /tmp/scala-2.12.8.tgz -C /tmp/ && \
    mv /tmp/scala-2.12.8/* /usr/share/scala/ && \
    rm -rf /tmp/scala-2.12.8 /tmp/scala-2.12.8.tgz && \
    cp /usr/share/scala/bin/* /usr/bin/ && \
    # get spark sources
    wget https://mirrors.tongji.edu.cn/apache/spark/spark-3.0.1/spark-3.0.1-bin-without-hadoop.tgz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/spark-3.0.1-bin-without-hadoop.tgz -C /home/hadoop/ && \
    mv /home/hadoop/spark-3.0.1-bin-without-hadoop /home/hadoop/spark && \
    rm /home/hadoop/spark-3.0.1-bin-without-hadoop.tgz && \
    # set spark-env.sh
    mv /home/hadoop/spark/conf/spark-env.sh.template /home/hadoop/spark/conf/spark-env.sh && \
    echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /home/hadoop/spark/conf/spark-env.sh && \
    echo "export SPARK_LOG_DIR=/home/hadoop/spark/logs" >> /home/hadoop/spark/conf/spark-env.sh && \
    mv /home/hadoop/spark/conf/spark-defaults.conf.template /home/hadoop/spark/conf/spark-defaults.conf && \
    echo "spark.eventLog.dir file:/home/hadoop/spark/logs" >> /home/hadoop/spark/conf/spark-defaults.conf && \
    echo "spark.history.fs.logDirectory file:/home/hadoop/spark/logs" >> /home/hadoop/spark/conf/spark-defaults.conf && \
    mkdir /home/hadoop/spark/logs && \
    # permissions
    chown hadoop -R /home/hadoop/spark

# set environment variables
ENV SCALA_HOME /usr/share/scala
ENV SPARK_HOME /home/hadoop/spark
ENV SPARK_LOG_DIR /home/hadoop/spark/logs
# ENV SPARK_DIST_CLASSPATH $(hadoop classpath) does not work
RUN export SPARK_DIST_CLASSPATH=$(hadoop classpath)
ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH



