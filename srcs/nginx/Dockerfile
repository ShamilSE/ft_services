FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor vim openssl

COPY ./nginx.conf /etc/nginx/nginx.conf
#COPY ./supervisord.conf /etc/supervisord.conf

RUN openssl req -x509 -nodes -days 365 -subj\
	"/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Evolution/CN=localhost"\
	-newkey rsa:2048 -keyout /etc/ssl/shamil.key -out /etc/ssl/shamil.crt;

COPY ./run_nginx.sh /tmp/
RUN chmod 555 tmp/run_nginx.sh
EXPOSE 80 443
CMD ["/tmp/run_nginx.sh"]
