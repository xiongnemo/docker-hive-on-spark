FROM anzupop/spark_hive_cluster:spark

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# get sources
RUN apt install -y libpostgresql-jdbc-java

RUN wget https://mirrors.tongji.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/apache-hive-3.1.2-bin.tar.gz -C /home/hadoop/ && \
    mv /home/hadoop/apache-hive-3.1.2-bin /home/hadoop/hive && \
    rm -rf /home/hadoop/apache-hive-3.1.2*
# hadoop's guava's version is way higher than hive's
RUN cp /home/hadoop/hadoop/share/hadoop/common/lib/guava-27.0-jre.jar /home/hadoop/hive/lib/ && rm /home/hadoop/hive/lib/guava-19.0.jar

# set environment variables
ENV HIVE_HOME /home/hadoop/hive
ENV PATH $HIVE_HOME/bin:$PATH

RUN cp /usr/share/java/postgresql-jdbc4.jar /home/hadoop/hive/lib/

# TODO: should mount config here
# ADD configs/hive-site.xml $HIVE_HOME/conf/hive-site.xml
RUN echo "export HADOOP_HOME=/home/hadoop/hadoop" >> /home/hadoop/hive/bin/hive-config.sh

RUN chown hadoop -R /home/hadoop/hive
RUN export LANGUAGE=en_US.UTF-8

# COPY ./hive/entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]