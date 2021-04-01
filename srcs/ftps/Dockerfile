FROM alpine:3.12

RUN	echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add vsftpd openssl supervisor telegraf \
	&&	mkdir -p /var/ftp \
	&& rm -rf /var/cache/apk/*

COPY ./src/telegraf.conf /etc/telegraf/

RUN openssl req\
	-x509\
	-nodes\
	-days 365\
	-subj "/C=RU/ST=Kazan/L=Kazan/O=school21, Inc./CN=school21"\
	-addext "subjectAltName=DNS:mismene.com"\
	-newkey rsa:2048\
	-keyout /etc/vsftpd/ftps.key\
	-out /etc/vsftpd/ftps.crt

RUN adduser -D -g 'mismene' mismene
RUN echo "mismene:password" | chpasswd

COPY src/supervisord.conf /etc/
COPY src/start.sh /
COPY src/vsftpd.conf /etc/vsftpd/

EXPOSE 21 21000

CMD sh start.sh
