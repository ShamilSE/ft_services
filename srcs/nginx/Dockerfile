FROM alpine:3.12.1

RUN apk update && apk upgrade
RUN apk add openssl openrc openssh nginx curl libc6-compat supervisor
	
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY supervisor.conf /etc/supervisord.conf
	
RUN rc-update add sshd \
	&& adduser -D -g 'www' www \
	&& echo "www:password" | chpasswd \
	&& adduser -D mismene \
	&& echo "mismene:password" | chpasswd \
	&& mkdir /run/nginx/ \
	&& mkdir /www \
	&& ssh-keygen -A \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& rm -rf /var/cache/apk/*
	
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/
		 
COPY telegraf.conf /etc/telegraf/
COPY page /www/
COPY sshd_config /etc/ssh/
COPY start_nginx.sh .


RUN openssl req \
		-newkey rsa:2048 -nodes -keyout local_host.key \
		-x509 -days 365 -out local_host.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21school/OU=21/CN=mismene" \
	&& chmod 600 local_host.key local_host.crt

EXPOSE 80 443 22

CMD sh start_nginx.sh
