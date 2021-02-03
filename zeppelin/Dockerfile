FROM anzupop/spark_hive_cluster:hive

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# get zeppelin sources
RUN wget https://mirrors.tongji.edu.cn/apache/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/zeppelin-0.9.0-bin-all.tgz -C /home/hadoop/ && \
    mv /home/hadoop/zeppelin-0.9.0-bin-all /home/hadoop/zeppelin && \
    rm -rf /home/hadoop/zeppelin-0.9.0-bin-all* && \
    # set zeppelin-env.sh
    echo "export ZEPPELIN_ADDR=0.0.0.0" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    echo "export ZEPPELIN_PORT=8081" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    echo "export SPARK_HOME=/home/hadoop/spark" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    # set hadoop conf dir
    echo "export HADOOP_HOME=/home/hadoop/hadoop" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    echo "export HIVE_HOME=/home/hadoop/hive" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    echo "export ZEPPELIN_INTP_CLASSPATH_OVERRIDES=$HIVE_HOME/conf" >> /home/hadoop/zeppelin/conf/zeppelin-env.sh && \
    # permissions
    chown hadoop -R /home/hadoop/zeppelin



# set options to pass spark-submit command
# export SPARK_SUBMIT_OPTIONS="--packages com.databricks:spark-csv_2.10:1.2.0"

