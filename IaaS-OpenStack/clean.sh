#!/bin/bash

echo 'Cleaning network, router and instances as "project_admin"'
ansible-playbook pb-clean-project-admin.yml

echo 'Cleaning project, users, images and flavors as "admin"'
ansible-playbook pb-clean-admin.yml
