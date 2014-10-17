#!/bin/sh -x

apt-get install haproxy

sed -i '/ENABLED/ s,0,1,' /etc/default/haproxy
