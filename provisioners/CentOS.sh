#!/bin/bash -e

echo "Install useful utilities and /etc/hosts"

# Obtain Master IP from text file created by master.sh and add it to /etc/hosts
MASTERIP=$(cat /vagrant/masterip.txt)
echo "$MASTERIP master.devops.local master" | sudo tee -a /etc/hosts

# Install vim for convenience
sudo yum install -q -y vim
