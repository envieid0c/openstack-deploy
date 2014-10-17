#!/bin/sh -x

cp configs/nova.conf /etc/nova/
cp configs/neutron.conf /etc/neutron/
cp configs/glance* /etc/glance/

nova-manage db sync

neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini upgrade head

glance-manage db_sync

for sv in nova-api nova-cert nova-compute nova-conductor nova-consoleauth nova-scheduler neutron-dhcp-agent neutron-metadata-agent neutron-ovs-cleanup neutron-plugin-openvswitch-agent neutron-server glance-api glance-registry
do
    stop $sv; start $sv
done


