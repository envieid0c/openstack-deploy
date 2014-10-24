#!/bin/sh -x

mysql -e "CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 's3cretPass';"

mysql -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost';"

mysql -e "GRANT USAGE ON *.* TO 'sstuser'@'host1' IDENTIFIED BY 's3cretPass';"
mysql -e "GRANT ALL ON *.* to 'openstack'@'host1' IDENTIFIED BY 's3cretPass';"

mysql -e "GRANT USAGE ON *.* TO 'sstuser'@'host2' IDENTIFIED BY 's3cretPass';"
mysql -e "GRANT ALL ON *.* to 'openstack'@'host2' IDENTIFIED BY 's3cretPass';"

mysql -e "GRANT USAGE ON *.* TO 'sstuser'@'host3' IDENTIFIED BY 's3cretPass';"
mysql -e "GRANT ALL ON *.* to 'openstack'@'host3' IDENTIFIED BY 's3cretPass';"

mysql -e "GRANT ALL ON *.* to 'openstack'@'localhost' IDENTIFIED BY 's3cretPass';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE IF NOT EXISTS nova;"

mysql -e "CREATE DATABASE IF NOT EXISTS neutron;"

mysql -e "CREATE DATABASE IF NOT EXISTS glance CHARSET=utf8;"

mysql -e "CREATE DATABASE IF NOT EXISTS keystone;"

rabbitmqctl add_user openstack s3cretPass
rabbitmqctl set_permissions openstack '.*' '.*' '.*'
rabbitmqctl set_user_tags openstack administrator

rabbitmqctl set_policy ha '.*' '{"ha-mode":"all"}'
