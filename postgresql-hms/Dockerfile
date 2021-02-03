FROM postgres

MAINTAINER Nemo Xiong <nemo@anzupop.com>

RUN export LANGUAGE=en_US.UTF-8

COPY ./postgresql-hms/init/init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN chown postgres:postgres /docker-entrypoint-initdb.d/*
