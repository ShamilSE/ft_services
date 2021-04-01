FROM alpine:3.12

ENV TELEGRAF_VERSION 1.6.3

RUN apk update && apk upgrade \
    && apk add mariadb mariadb-client curl supervisor\
    && apk add openrc \
    && rm -rf /var/cache/apk/*

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 
COPY telegraf.conf /etc/telegraf/

COPY supervisord.conf /etc/
COPY my.cnf /etc/
COPY start_mariadb.sh .
COPY my_db.sql .
COPY create_db .

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT sh start_mariadb.sh
