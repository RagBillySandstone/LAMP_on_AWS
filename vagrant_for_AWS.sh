#!/bin/bash
# Install Vagrant 1.9.7 with AWS support on a local Ubuntu machine
# http://blog.scottlowe.org/2016/09/15/using-vagrant-with-aws/

echo "Making sure you have priviledges..."
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi


echo "Getting the .deb file..."
wget https://releases.hashicorp.com/vagrant/1.9.7/vagrant_1.9.7_i686.deb


echo "Installing the package..."
apt-get -y install vagrant_1.9.7_i686.deb


echo "Installing Vagrant AWS plugin..."
vagrant plugin install vagrant-aws


echo "Installing Vagrant AWS dummy box..."
vagrant box add aws-dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box


echo "Cleaning up..."
rm -f vagrant_1.9.7_i686.deb 
