FROM alpine:3.12.1

RUN apk update && apk upgrade \
RUN apk add sudo vim mysql mysql-client supervisor \
    openrc mariadb mariadb-common mariadb-client \
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz ./

RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 
COPY telegraf.conf /etc/telegraf/

COPY supervisord.conf /etc/
COPY my.cnf /etc/
COPY run_mysql.sh .
COPY my_db.sql .
COPY create_db .

RUN sudo chmod -R 777 /var/lib/mysql/
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh run_mysql.sh
