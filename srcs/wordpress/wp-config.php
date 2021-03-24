<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', 'pass' );
define( 'DB_HOST', 'mysql-services' );
define( 'DB_CHARSET', 'utf-8' );
/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false );
define( 'WP_DEBUG_LOG', true );

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
