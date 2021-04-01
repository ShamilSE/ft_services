FROM alpine:3.12

RUN apk update && apk upgrade
RUN	echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add openssl nginx supervisor telegraf
	
RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
	
COPY telegraf.conf /etc/telegraf/
COPY page /www/
COPY start_nginx.sh .

RUN openssl req -newkey rsa:2048 -nodes -keyout local_host.key \
		-x509 -days 365 -out local_host.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21school/OU=21/CN=mismene"

EXPOSE 80 443 22

CMD sh start_nginx.sh
