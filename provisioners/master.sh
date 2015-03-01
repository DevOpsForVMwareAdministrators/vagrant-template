#!/bin/bash -e

echo "Installing useful utilities"
# Update package sources
sudo apt-get -qq update

# Install vim for convenience
sudo apt-get -qq -y install vim

# Get Master IP and store it in a text file
ifconfig eth0 | awk '/inet addr/ {split ($2,A,":"); print A[2]}' > /vagrant/masterip.txt
