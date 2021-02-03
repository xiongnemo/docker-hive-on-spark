FROM anzupop/spark_hive_cluster:base

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# get nifi sources
RUN wget https://mirrors.tongji.edu.cn/apache/nifi/1.12.1/nifi-1.12.1-bin.tar.gz -P /home/hadoop/ && \
    tar -xzf /home/hadoop/nifi-1.12.1-bin.tar.gz -C /home/hadoop/ && \
    mv /home/hadoop/nifi-1.12.1 /home/hadoop/nifi && \
    rm -rf /home/hadoop/nifi-1.12.1* && \ 
    # set nifi-env.sh
    echo -e "\n" >> /home/hadoop/nifi/bin/nifi-env.sh && \ 
    echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/hadoop/nifi/bin/nifi-env.sh && \ 
    echo "export TOOLS_JAR=${JAVA_HOME}/lib/tools.jar" >> /home/hadoop/nifi/bin/nifi-env.sh && \ 
    # permissions
    chown hadoop -R /home/hadoop/nifi




