#!/bin/sh -x

apt-add-repository 'deb http://repo.percona.com/apt trusty main'
apt-get update
apt-get install percona-xtradb-cluster-56 -y --force-yes -qq

export ip=$(hostname -i)
mkdir -p /etc/mysql/conf.d
envsubst < configs/galera-cluster.cnf > /etc/mysql/conf.d/galera-cluster.cnf
