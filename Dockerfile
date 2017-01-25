FROM ubuntu:16.10 
MAINTAINER Stenn Kool <stennkool@gmail.com>


RUN apt-get update && apt-get -y install supervisor git nginx curl php7.0-fpm php7.0-mcrypt php7.0-json php7.0-pgsql php7.0-curl libjpeg-dev && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /var/www

RUN /bin/rm /etc/nginx/sites-enabled/default

RUN /bin/mkdir /run/php

COPY wordpress.conf /etc/nginx/sites-enabled/wordpress

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
