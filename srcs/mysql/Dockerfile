FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add sudo vim mysql mysql-client supervisor \
    openrc mariadb mariadb-common mariadb-client \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir -p /run/mysqld/
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./my.cnf /etc/
COPY ./run_mysql.sh /tmp/
RUN sudo chmod -R 755 /var/lib/mysql/
RUN chmod +x tmp/run_mysql.sh

# Открытие волюма
VOLUME ["/var/lib/mysql"]

# Открытие портов
EXPOSE 3306

# Запуск
CMD tmp/run_mysql.sh
