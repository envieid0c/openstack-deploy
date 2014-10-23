#!/bin/sh -x

cp configs/keystone.conf /etc/keystone/

keystone-manage db_sync
stop keystone; start keystone

export OS_SERVICE_ENDPOINT="http://localhost:35357/v2.0/"
export OS_SERVICE_TOKEN="s3cr3tT0K3N"

keystone bootstrap --user-name root --pass pass --role-name admin --tenant-name demo
keystone tenant-create --name service

keystone user-create --name nova --tenant service --pass s3cretPass
keystone user-role-add --user nova --role admin --tenant service

keystone user-create --name neutron --tenant service --pass s3cretPass
keystone user-role-add --user neutron --role admin --tenant service

keystone user-create --name glance --tenant service --pass s3cretPass
keystone user-role-add --user glance --role admin --tenant service
