#!/bin/bash

echo "* Stop SE Linux ..."
sudo setenforce permissive
sudo sed -i 's\=enforcing\=permissive\g' /etc/sysconfig/selinux

echo "* Add any prerequisites ..."
dnf install -y python3 python3-pip

echo "* Install the EPEL repository ..."
dnf install -y epel-release

echo "* Install Ansible ..."
dnf install -y ansible

echo "* Show the version of Ansible ..."
ansible --version

echo "* Make the master to add the SSH public keys of the hosts to the known_hosts file periodically ..."
echo "* * * * * root ssh-keyscan -f /shared/master/hosts.conf > /root/.ssh/known_hosts" | tee /etc/cron.d/ssh-scan

echo "* Generate SSH public and private key ..."
ssh-keygen -b 2048 -f /home/vagrant/.ssh/id_rsa -N ""

echo "* Save the public key in a shared folder ..."
cat /home/vagrant/.ssh/id_rsa.pub | tee /shared/master/ansible-public-key.conf

echo "* Create ansible workspace directory ..."
mkdir -p /home/vagrant/ansible
cp -r /shared/master/ansible-components/* /home/vagrant/ansible/
mkdir -p /home/vagrant/ansible/web
mkdir -p /home/vagrant/ansible/db
cp -r /shared/web/* /home/vagrant/ansible/web
cp -r /shared/db/* /home/vagrant/ansible/db/db_setup.sql
cp -r /shared/playbooks/* /home/vagrant/ansible/







