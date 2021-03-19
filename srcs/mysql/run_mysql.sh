#!/bin/sh
rc default
mysql_install_db
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

rc-service mariadb start

mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE my_db;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON my_db.* TO 'admin'@'%' WITH GRANT OPTION;
CREATE USER 'mismene'@'%' IDENTIFIED BY 'password'" ;
GRANT ALL PRIVILEGES ON my_db.* TO 'wordpress'@'%' WITH GRANT OPTION;
CREATE USER 'anton'@'%' IDENTIFIED BY 'password'" ;
GRANT ALL PRIVILEGES ON my_db.* TO 'wordpress'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

rc-service mariadb stop
./usr/bin/mysqld --datadir=/var/lib/mysqld --socket=/run/mysqld/mysqld.sock
