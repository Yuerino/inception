FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y php php-common php-fpm php-mysql

EXPOSE 9000

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/wordpress-latest.tar.gz /var/www/
COPY tools/setup-wordpress.sh /var/www/

RUN chmod +x /var/www/setup-wordpress.sh
RUN mkdir -p /run/php/

ENTRYPOINT [ "/var/www/setup-wordpress.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]
