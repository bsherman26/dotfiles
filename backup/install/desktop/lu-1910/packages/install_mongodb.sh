#!/bin/bash

echo "Installing MongoDB"

#-----------------------------------------
# MongoDB
#-----------------------------------------

# MongoDB Deb Package
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# MongoDB Install
sudo apt-get update -y && sudo apt-get install -y mongodb-org

# MongoDB Config
sudo mv /etc/mongod.conf /etc/mongod.conf.dpkg-dist
sudo ln -s ~/src/projects/dotfiles/etc/mongod.conf /etc/mongod.conf

# MongoDB Service
sudo systemctl enable mongod.service
sudo systemctl start mongod.service
