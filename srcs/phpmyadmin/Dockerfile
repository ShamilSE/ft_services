FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget nginx supervisor php7-common php7-session php7-iconv php7-json\
	php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi\
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc\
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

COPY supervisor.conf etc/supervisord.conf

WORKDIR /var/www/
RUN wget files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz

WORKDIR /
COPY ./config.inc.php /var/www/phpmyadmin
COPY ./run_phpmyadmin.sh .
RUN chmod 777 run_phpmyadmin.sh

EXPOSE 5000

CMD ./run_phpmyadmin.sh

