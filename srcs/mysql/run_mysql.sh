#!/bin/sh
rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE my_db;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON my_db.* TO 'admin'@'%' WITH GRANT OPTION;
CREATE USER 'mismene'@'%' IDENTIFIED BY 'password'" ;
GRANT ALL PRIVILEGES ON my_db.* TO 'wordpress'@'%' WITH GRANT OPTION;
CREATE USER 'anton'@'%' IDENTIFIED BY 'password'" ;
GRANT ALL PRIVILEGES ON my_db.* TO 'wordpress'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT


#mysql -u root my_db < my_db.sql

/etc/init.d/mariadb stop
#rc-service mariadb stop
sh
