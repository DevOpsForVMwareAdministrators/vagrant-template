#!/bin/bash -e

echo "Install useful utilities and /etc/hosts"
# Obtain Master IP from text file created by master VM and add it to /etc/hosts
MASTERIP=$(cat /vagrant/masterip.txt)
echo "$MASTERIP master.devops.local puppet" | sudo tee -a /etc/hosts

# Update package sources
sudo apt-get -qq update

# Install vim for convenience
sudo apt-get -qq -y install vim
