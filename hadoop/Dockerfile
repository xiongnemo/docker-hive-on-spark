FROM anzupop/spark_hive_cluster:base

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# get hadoop sources
RUN wget https://mirrors.tongji.edu.cn/apache/hadoop/core/hadoop-3.3.0/hadoop-3.3.0.tar.gz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/hadoop-3.3.0.tar.gz -C /home/hadoop/ && \
    mv /home/hadoop/hadoop-3.3.0 /home/hadoop/hadoop && \
    rm -rf /home/hadoop/hadoop-3.3.0*

# set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME /home/hadoop/hadoop
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV HADOOP_MAPRED_HOME $HADOOP_HOME 
ENV HADOOP_COMMON_HOME $HADOOP_HOME 
ENV HADOOP_HDFS_HOME $HADOOP_HOME 
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV YARN_HOME $HADOOP_HOME
ENV PATH $JAVA_HOME/bin:$PATH
ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# set hadoop-env.sh
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_HOME=/home/hadoop/hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_NAMENODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_DATANODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_SECONDARYNAMENODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh

# create folders for nodes
RUN mkdir -p /home/hadoop/data/nameNode /home/hadoop/data/dataNode /home/hadoop/data/nameNodeSecondary /home/hadoop/data/tmp && \
    mkdir -p /home/hadoop/hadoop/logs

# TODO: should mount config here
# ADD configs/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
# ADD configs/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
# ADD configs/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
# ADD configs/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
# ADD configs/workers $HADOOP_HOME/etc/hadoop/workers

# permissions
RUN chown hadoop -R /home/hadoop/data && \
    chown hadoop -R /home/hadoop/hadoop

CMD service ssh start 
