<?php
define( 'WP_SITEURL', 'https://localhost' );
define( 'WP_INSTALLING', true );

require_once 'wp-load.php';
require_once 'wp-admin/includes/upgrade.php';
require_once 'wp-includes/wp-db.php';

wp_install( 'cthien-h Inception', 'notuser', 'admin@example.com', false, null, 'test1234' );
wp_create_user( 'user', 'test1234', 'user@example.com' );

die();
?>
