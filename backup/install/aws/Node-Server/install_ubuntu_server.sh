#!/bin/sh


#---------------------------------
# Create a Directory to Archive Generated Files
#---------------------------------
mkdir install


#---------------------------------
# Update Init Packages
#---------------------------------
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get update -y


#---------------------------------
# User > Admin > Create
#---------------------------------

sudo adduser brian           # Create Admin User
#sudo vim /etc/group         # Add Required Group Membership
sudo chmod 0750 /home/brian  # Secure Admin User Home Directory

# User > Admin > Config
sudo su brian
cd $HOME

# SSH
mkdir .ssh
chmod 700 .ssh
cd .ssh
touch authorized_keys # TODO: Add Public Key
chmod 600 authorized_keys
sudo bash -c "echo 'AllowUsers brian' >> /etc/ssh/sshd_config"
sudo service ssh restart # TODO: REVIEW (Should this be systemctl restart sshd)
# TODO: TEST Login


# TODO: Remove Default "ubuntu" User (Partially)
#sudo vim /etc/ssh/sshd_config
#    ( )-> Remove ubuntu user from AllowUsers statements
#    ( )-> Set PermitRootLogin => no
#    ( )-> Restart sshd service
#sudo service ssh restart # TODO: REVIEW (Should this be systemctl restart sshd)
# TODO: TEST Login


# TODO: Ensure these are Set
#sudo bash -c "echo -e 'ChallengeResponseAuthentication no\n\
#PasswordAuthentication no\n\
#UserPAM no' >> /etc/ssh/sshd_config"

# TODO: Change SSH Damen Port
#sudo bash -c "sed -i -e 's/Port \(22\)/Port 16463/'"

#sudo service ssh restart # TODO: REVIEW (Should this be systemctl restart sshd)
# TODO: TEST Login


# TODO: Remove Default "ubuntu" User (Completely)
sudo deluser ubuntu
sudo rm -r /home/ubuntu
# TODO: Ensure all ubuntu group associations etc. are deleted (Can this be done with options???)


#---------------------------------
# Swap > Create
#---------------------------------
# TODO:
# 
# TODO: Add size param etc.
#
#---------------------------------
./mkswap.sh


