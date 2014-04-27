#!/usr/bin/env bash

# system and apps
apt-get update
apt-get dist-upgrade
apt-get install -y vim build-essential curl git-core libssl-dev htop redis-server

#mongo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
#use specific version for mongo packages
apt-get install mongodb-org=2.6.0 mongodb-org-server=2.6.0 mongodb-org-shell=2.6.0 mongodb-org-mongos=2.6.0 mongodb-org-tools=2.6.0
#pin mondo package versions so `apt-get update` doesn't upgrade them
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
#start mongo
service mongod start

# user login shell initialization script
cp /vagrant/vagrant/bash_profile /home/vagrant/.profile

# nvm, node
mkdir mainline
cd mainline
git clone https://github.com/creationix/nvm.git
. nvm/nvm.sh
nvm install 0.10

# npm global installs
npm install --global grunt-cli mocha strong-cli

# build app dependencies
cd /vagrant
npm install
