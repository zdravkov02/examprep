#!/bin/bash

echo "* Stop SE Linux ..."
sudo setenforce permissive
sudo sed -i 's\=enforcing\=permissive\g' /etc/sysconfig/selinux

echo "* Add any prerequisites ..."
dnf install -y python3 python3-pip

echo "* Save the ansible public key locally ..."
cat /shared/master/ansible-public-key.conf | tee /home/vagrant/.ssh/authorized_keys
