#!/bin/bash

echo 'Cleaning instances as "project_admin"'
ansible-playbook pb-clean-servers.yml

echo 'Deploying instances as "project_admin"'
ansible-playbook pb-deploy-servers.yml
