#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.99 ansible" >> /etc/hosts
echo "192.168.99.100 web" >> /etc/hosts
echo "192.168.99.101 db" >> /etc/hosts
echo "192.168.99.102 docker" >> /etc/hosts