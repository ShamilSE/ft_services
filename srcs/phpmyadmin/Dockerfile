FROM alpine:3.12.1

ENV TELEGRAF_VERSION 1.6.3

RUN apk update && apk upgrade && apk add openssh \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session openrc nginx php-fpm openssl wget supervisor \
	&& rm -rf /var/cache/apk/* \
	&& adduser -D -g 'www' www \
	&& mkdir /www && chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www && mkdir -p /run/nginx

WORKDIR /www

RUN openssl req  -newkey rsa:2048 -nodes -keyout local_host.key -x509 \
		-days 365 -out local_host.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=21/CN=mismene"

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /usr/share/webapps/ && cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin

COPY supervisor.conf /etc/supervisord.conf
COPY config.inc.php phpmyadmin/config.inc.php
COPY start_php.sh .

RUN chmod 644 phpmyadmin/config.inc.php

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 
COPY telegraf.conf /etc/telegraf/

EXPOSE 5000

CMD sh start_php.sh
