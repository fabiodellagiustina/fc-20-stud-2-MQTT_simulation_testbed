#!/bin/bash

echo 'Cleaning network, router, security groups and instances as "project_admin"'
ansible-playbook pb-clean-project-admin.yml

echo 'Releasing floating IP "172.24.4.100"'
openstack --os-cloud admin floating ip delete 172.24.4.100

echo 'Releasing floating IP "172.24.4.101"'
openstack --os-cloud admin floating ip delete 172.24.4.101

echo 'Cleaning project, users, images and flavors as "admin"'
ansible-playbook pb-clean-admin.yml
