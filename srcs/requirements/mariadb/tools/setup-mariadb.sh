#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
echo "Setting up database..."
mysql_install_db
service mysql start
# https://stackoverflow.com/a/36916378
mysql_secure_installation << EOF

y
toor
toor
y
n
y
y
EOF

mysql -uroot -ptoor << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

service mysql stop
fi

exec "$@"
