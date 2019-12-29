#!/bin/bash


#-----------------------------------------
# Packages
#-----------------------------------------
# TODO:
#
# Chrome:
# Pacs="$Pacs google-chrome-stable"
#
#-----------------------------------------

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get update -y

cd packages

./install_general.sh

./install_dev.sh

./install_utility.sh
./install_office.sh

./install_node.sh
./install_mongodb.sh

./install_lua.sh

./install_extra.sh


# ~/.bashrc >> Custom
cat <<'EOF' >> ${HOME}/.bashrc


# Source Custom
if [ -f "${HOME}"/.bashbas ]; then

    . "${HOME}"/.bashbas
fi
EOF


sudo apt-get update -y
./remove_general.sh

cd ..



#-----------------------------------------
# TODO:
#-----------------------------------------


#./install_python.sh
#./install_ruby.sh

#Pacs="$Pacs google-chrome-stable"
