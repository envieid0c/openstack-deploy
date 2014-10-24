#!/bin/sh -x

apt-get install haproxy -y --force-yes -qq

sed -i '/ENABLED/ s,0,1,' /etc/default/haproxy
cp ../openstack-basics/contrib/haproxy.cfg /etc/haproxy/

/etc/init.d/haproxy start
