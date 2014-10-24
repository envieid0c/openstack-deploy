#!/bin/sh -x

apt-get install rabbitmq-server -y --force-yes -qq

rabbitmq-plugins enable rabbitmq_management
/etc/init.d/rabbitmq-server restart
