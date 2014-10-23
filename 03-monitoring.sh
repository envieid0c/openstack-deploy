#!/bin/sh -x

apt-get install python-pip python-mysqldb python-flask python-gevent python-setuptools

cd ../openstack-basics
python setup.py install
