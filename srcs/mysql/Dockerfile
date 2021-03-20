FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client vim supervisor openrc sudo

COPY run_mysql.sh .
RUN chmod 777 run_mysql.sh

COPY my.cnf ./etc

RUN mkdir -p /var/lib/mysql
RUN sudo chmod -R 755 /var/lib/mysql
RUN mkdir -p /run/mysqld/


EXPOSE 3306

CMD ./run_mysql.sh
