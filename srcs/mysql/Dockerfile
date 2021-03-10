FROM debian:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client vim

RUN mkdir -p tmp/run
COPY ./run_nginx.sh /tmp/run

CMD ["/tmp/run/run_mysql.sh"]
