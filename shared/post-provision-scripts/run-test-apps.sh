#!/bin/bash
# Execute this script from the ansible workspace directory (/home/vagrant/ansible).



echo "* Deploy BGApp ..."
sudo ansible-playbook deploy.yml