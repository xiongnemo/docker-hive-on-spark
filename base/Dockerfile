FROM ubuntu:focal

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# open port 22

COPY ./tencent-cloud-focal-source/sources.list /etc/apt/sources.list

RUN apt update && \
    apt install ca-certificates -y

COPY ./sjtu-focal-source/sources.list /etc/apt/sources.list

# OpenJDK installation
RUN apt update && \
    apt install --no-install-recommends -y openjdk-8-jre openjdk-8-jdk openssh-server vim wget sudo

# add hadoop user
RUN useradd -m -s /bin/bash hadoop

# set pubkey authentication
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config && \
    mkdir -p /home/hadoop/.ssh && \
    echo "PubkeyAcceptedKeyTypes +ssh-dss" >> /home/hadoop/.ssh/config && \
    echo "PasswordAuthentication no" >> /home/hadoop/.ssh/config

# copy keys
ADD base/keys/id_rsa.pub /home/hadoop/.ssh/id_rsa.pub
ADD base/keys/id_rsa /home/hadoop/.ssh/id_rsa
RUN chmod 400 /home/hadoop/.ssh/id_rsa && \
    chmod 400 /home/hadoop/.ssh/id_rsa.pub && \
    cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys && \
    chown hadoop -R /home/hadoop/.ssh