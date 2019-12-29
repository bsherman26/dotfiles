#!/bin/sh


#---------------------------------
#  Node.js > Install
#---------------------------------
# TODO:
#
# TODO: Add Version etc.
#
#---------------------------------

# Newer Version Repos
#curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_8.x  | sudo -E bash -

sudo apt-get install -y nodejs


#---------------------------------
# Node Server Routing
#---------------------------------


# Create a Netfilter Rule to Route Port 80 -> 5000
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 5000

# Build, Save, and Load on Boot
sudo /sbin/iptables-save > ~/install/node_iptables.rules
sudo cp ~/install/node_iptables.rules /etc/network
sudo chown root:root /etc/network/node_iptables.rules
sudo chmod 644 node_iptables.rules
sudo bash -c "echo 'pre-up iptables-restore < /etc/network/node_iptables.rules' >> /etc/network/interfaces.d/60.cfg"
