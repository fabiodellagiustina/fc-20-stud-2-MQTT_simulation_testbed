#!/bin/bash

echo 'Deploying project, users, images and flavors as "admin"'
ansible-playbook pb-deploy-admin.yml

echo 'Allocating floating IP "172.24.4.100" to project "project"'
openstack --os-cloud admin floating ip create \
  --floating-ip-address 172.24.4.100 \
  --description "Web server" \
  --project project \
  public

echo 'Allocating floating IP "172.24.4.101" to project "project"'
openstack --os-cloud admin floating ip create \
  --floating-ip-address 172.24.4.101 \
  --description "MQTT broker" \
  --project project \
  public

echo 'Deploying key pair, network, router, security groups and ports as "project_admin"'
ansible-playbook pb-deploy-project-admin.yml

echo 'Deploying instances as "project_admin"'
ansible-playbook pb-deploy-servers.yml
