#!/bin/sh

if [ ! -f var/www/wordpress/wp-config.php ]; then
	echo "Setting up wordpress..."
	cd /var/www
	tar -xzvf wordpress-latest.tar.gz
	rm -rf wordpress-latest.tar.gz

	cd /var/www/wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
	mv ../wp-auto-install.php ./wp-auto-install.php
	sleep 5
	php -f wp-auto-install.php
fi

exec "$@"
