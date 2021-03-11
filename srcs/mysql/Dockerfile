FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client vim supervisor openrc
COPY run_mysql.sh .
COPY my.cnf etc/my.cnf

CMD sh run_mysql.sh
