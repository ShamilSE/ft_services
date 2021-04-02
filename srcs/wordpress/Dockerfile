FROM alpine:3.12

RUN apk update && apk upgrade \
    && apk add wget \
    && apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \ 
    && apk add nginx openrc supervisor \
    && adduser -D -g 'www' www \
    && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir -p /run/nginx \
    && rm -rf /var/cache/apk/*

RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress /www/ \
    && rm latest.zip
    
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 
        
COPY telegraf.conf /etc/telegraf/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
COPY wp-config.php /www/wordpress/
COPY start_wp.sh .

EXPOSE 5050

ENTRYPOINT sh start_wp.sh
