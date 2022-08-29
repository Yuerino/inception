FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y mariadb-client mariadb-server

EXPOSE 3306

COPY conf/my.cnf /etc/mysql/
COPY tools/setup-mariadb.sh /var/mariadb/

RUN chmod +x /var/mariadb/setup-mariadb.sh
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

ENTRYPOINT [ "/var/mariadb/setup-mariadb.sh" ]

CMD [ "mysqld" ]
