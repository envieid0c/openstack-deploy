#!/bin/sh -x

apt-get install python-pip python-mysqldb python-flask python-gevent python-setuptools python-pbr -y --force-yes -qq

cd ../openstack-basics
python setup.py install
nohup os_slb_checks & disown
