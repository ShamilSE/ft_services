FROM alpine:3.12

#RUN echo "https://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add vim supervisor sudo php7-fpm php7-common php7-session\
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli\
	php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc\
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom wget\
	nginx

COPY supervisor.conf etc/supervisord.conf


RUN wget https://wordpress.org/latest.tar.gz
RUN mv latest.tar.gz /var/www/
WORKDIR /var/www
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz

COPY ./wp-config.php /var/www/wordpress
COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /
COPY run_wordpress.sh .
RUN chmod 777 run_wordpress.sh

EXPOSE 5050 

CMD ./run_wordpress.sh
