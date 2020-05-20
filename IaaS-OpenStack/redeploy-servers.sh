#!/bin/bash

echo 'Cleaning instances as "project_admin"'
ansible-playbook -v pb-clean-servers.yml

echo 'Deploying instances as "project_admin"'
ansible-playbook -v pb-deploy-servers.yml
