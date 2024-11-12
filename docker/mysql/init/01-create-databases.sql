-- create databases
CREATE DATABASE IF NOT EXISTS `fitfeedkc`;
CREATE DATABASE IF NOT EXISTS `fitfeedapi`;

-- create root user and grant rights
CREATE USER 'admin'@'%' IDENTIFIED BY 'joshiscool';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

-- create user for spring app
USE fitfeedapi;
CREATE USER 'fitfeed'@'%' IDENTIFIED BY 'fitfeedapi';
GRANT ALL PRIVILEGES ON fitfeedapi.* TO 'fitfeed'@'%';

-- create user for keycloak service
USE fitfeedkc;
CREATE USER 'keycloak'@'%' IDENTIFIED BY 'fitfeedkc';
GRANT ALL PRIVILEGES ON fitfeedkc.* TO 'keycloak'@'%';
