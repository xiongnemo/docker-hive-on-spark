FROM gethue/hue:latest

MAINTAINER Nemo Xiong <nemo@anzupop.com>

USER root

# TODO: should mount config here
# ADD configs/hue.ini /usr/share/hue/desktop/conf/hue.ini
# RUN chmod 777 /usr/share/hue/desktop/conf/hue.ini
# ADD configs/hue.ini /usr/share/hue/desktop/conf/hue-overrides.ini
# RUN chmod 777 /usr/share/hue/desktop/conf/hue-overrides.ini
# ADD configs/hue.ini /usr/share/hue/tools/docker/hue/conf/hue-overrides.ini
# RUN chmod 777 /usr/share/hue/tools/docker/hue/conf/hue-overrides.ini

RUN mkdir -p /etc/hive/conf
RUN chmod 777 /etc/hive/conf

# set environment variables
ENV HIVE_CONF_DIR /etc/hive/conf

# TODO: should mount config here
# ADD configs/hive-site.xml $HIVE_CONF_DIR/hive-site.xml
# RUN chmod 777 $HIVE_CONF_DIR/hive-site.xml
