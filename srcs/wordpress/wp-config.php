<?php
define( 'DB_NAME', 'my_db' );
define( 'DB_USER', 'admin' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'mysql-service' );
define( 'DB_CHARSET', 'utf-8' );
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false );
define( 'WP_DEBUG_LOG', true );

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
