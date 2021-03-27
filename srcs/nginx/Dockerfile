FROM alpine:3.12.1

RUN apk update && apk upgrade
RUN apk add nginx supervisor vim openssl openssh openrc curl libc6-compat
	
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY supervisor.conf /etc/supervisord.conf

RUN adduser -D -g 'www' www && echo "www:1234" | chpasswd
RUN mkdir /www
RUN chown -R www:www var/lib/nginx
RUN chown -R www:www /www

COPY page/ /www/
	
RUN rc-update add sshd
	
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/
		 
COPY telegraf.conf /etc/telegraf/
COPY sshd_config /etc/ssh/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Evolution/CN=localhost" -new -newkey rsa:2048 -keyout /etc/ssl/shamil.key -out /etc/ssl/shamil.crt;

COPY run_nginx.sh .
RUN mkdir -p /run/nginx
RUN chmod 555 ./run_nginx.sh
EXPOSE 80 443 22
CMD sh run_nginx.sh
