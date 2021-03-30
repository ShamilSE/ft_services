<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'my_db');

/** MySQL database username */
define('DB_USER', 'admin');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('DB_HOST', 'cip-mariadb');

define('WP_HOME', 'http://192.168.99.101:5050' );

define('WP_SITEURL', 'http://192.168.99.101:5050' );
/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'sgdsdgdERDTRYDGcxb4333Dgd!##yu*&^^?ZSRSTgdtdydyfFJJ466RGRNh^&(??');
define('SECURE_AUTH_KEY',  'DSdfsdsSDGSDGDSF.aarwe13525#@$%@%T^CGHFHdhdhfh\]..sdsSWETETEYEYq');
define('LOGGED_IN_KEY',    '1232ewfesERTETE34457%&&%Tghfgerutiowq2themIo__fghfhfgrt*77^GHFhf');
define('NONCE_KEY',        'sfdSDGSDGSGgsgsdgst45346rgDgdfdhf564fhdhdHDF%&&%^dfdhfghfgjgjjjf');
define('AUTH_SALT',        'fgdfdrerDT%$%#5THFHChfgfjfdfdDHDFHFFHJfffhfjERERTYYRYryrut(*&gfg');
define('SECURE_AUTH_SALT', 'Ddgdgrer4465$$^%%RTJ>,,nNgrtryyeEETERY7&^55*IhgfDdGJKl;[Outtfgfd');
define('LOGGED_IN_SALT',   'dfgdhdfFHFDHFswewte^%$$$dgdhfhdfhfgjfgjGJTT&^%456457esfdf46TRrhg');
define('NONCE_SALT',       'IUy678ttjfgFGY*^&&%Df34$#2!!dfhdhfgjfkgKL;;;PIujlLll:hgjguurt876');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
