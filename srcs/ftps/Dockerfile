FROM alpine:3.12.3

RUN apk update && apk add vsftpd openssl libc6-compat supervisor \
	&&	mkdir -p /var/ftp \
	&& rm -rf /var/cache/apk/*


RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
	&& tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / \
	&& rm telegraf-1.17.0_linux_amd64.tar.gz
COPY src/telegraf.conf /etc/telegraf/

RUN openssl req\
	-x509\
	-nodes\
	-days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=Ft_servicesCompany, Inc./CN=ft_services.com"\
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
