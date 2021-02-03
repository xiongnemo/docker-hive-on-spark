FROM postgres

MAINTAINER Nemo Xiong <nemo@anzupop.com>

# USER root

RUN export LANGUAGE=en_US.UTF-8
# ADD configs/hive-schema-2.3.0.postgres.sql /hive/hive-schema-2.3.0.postgres.sql
# ADD configs/hive-txn-schema-2.3.0.postgres.sql /hive/hive-txn-schema-2.3.0.postgres.sql

# TODO: should mount config here
COPY ./postgresql-hms/init/init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN chown postgres:postgres /docker-entrypoint-initdb.d/*
# RUN chown postgres:postgres /hive/*
