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
./install_python.sh

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

# Clean Up
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y


#-----------------------------------------
# TODO: Chrome
#-----------------------------------------

##Pacs="$Pacs google-chrome-stable"

## Finish Setting Google Chrome as Default Browser
#sudo update-alternatives --config x-www-browser
    #- Select /usr/bin/google-chrome-stable  mode manual

#sudo update-alternatives --config gnome-www-browser
    #- Select /usr/bin/google-chrome-stable  mode manual


## TEST by checking:
##echo $BROWSER = /usr/bin/google-chrome-stable

#-----------------------------------------
# TODO: Pulse Audio (New Config Files)
#-----------------------------------------

# New Config Files etc.
# Notes in $HOME/.config/pulse/README
