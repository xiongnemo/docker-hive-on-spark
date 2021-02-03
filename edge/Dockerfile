FROM anzupop/spark_hive_cluster:hive

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# get flume sources
RUN wget https://mirrors.tongji.edu.cn/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/apache-flume-1.9.0-bin.tar.gz -C /home/hadoop/ && \
    mv /home/hadoop/apache-flume-1.9.0-bin /home/hadoop/flume && \
    rm -rf /home/hadoop/apache-flume-1.9.0-bin* && \
    chown hadoop -R /home/hadoop/flume && \
    # get Kafka sources
    wget https://mirrors.tongji.edu.cn/apache/kafka/2.7.0/kafka_2.13-2.7.0.tgz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/kafka_2.13-2.7.0.tgz -C /home/hadoop/ && \
    mv /home/hadoop/kafka_2.13-2.7.0 /home/hadoop/kafka && \
    rm -rf /home/hadoop/kafka_2.13-2.7.0* && \
    chown hadoop -R /home/hadoop/kafka && \
    # get sqoop sources
    wget https://mirrors.tongji.edu.cn/apache/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -C /home/hadoop/ && \
    mv /home/hadoop/sqoop-1.4.7.bin__hadoop-2.6.0 /home/hadoop/sqoop && \
    rm -rf /home/hadoop/sqoop-1.4.7* && \
    # get sqoop lib
    wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.9/postgresql-42.2.9.jar -P /home/hadoop/sqoop/lib/ && \
    wget https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar -P /home/hadoop/sqoop/lib/ && \
    chown hadoop -R /home/hadoop/sqoop

ENV KAFKA_HOME=/home/hadoop/kafka
ENV PATH $KAFKA_HOME/bin:$PATH

ENV SQOOP_HOME /home/hadoop/sqoop
ENV PATH $PATH:$SQOOP_HOME/bin

