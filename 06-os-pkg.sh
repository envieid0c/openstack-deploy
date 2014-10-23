#!/bin/sh -x

apt-get install keystone openstack-dashboard python-lesscpy nova-compute-kvm nova-api nova-cert nova-conductor nova-consoleauth nova-scheduler neutron-server neutron-plugin-openvswitch neutron-plugin-openvswitch-agent neutron-dhcp-agent neutron-metadata-agent glance-api glance-registry rsync python-netifaces python-xattr python-keystoneclient python-swiftclient python-webob swift swift-proxy swift-plugin-s3 swift-account swift-container swift-object -y --force-yes -qq
