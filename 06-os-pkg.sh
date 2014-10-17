#!/bin/sh -x

apt-get install keystone openstack-dashboard python-lesscpy nova-compute-kvm nova-api nova-cert nova-conductor nova-consoleauth nova-scheduler neutron-server neutron-plugin-openvswitch neutron-plugin-openvswitch-agent neutron-dhcp-agent neutron-metadata-agent glance-api glance-registry -y --force-yes -qq
