#!/bin/bash

echo "TODO => Installing Ruby"

#-----------------------------------------
# TODO: Ruby => rvm (Ruby Version Manager)
#-----------------------------------------

# rvm Dependency
sudo apt-get install software-properties-common

# Ruby Version Manager Deb Package
sudo apt-add-repository -y ppa:rael-gc/rvm

# Ruby Version Manager
sudo apt-get update -y && sudo apt-get install -y rvm

# Ruby Versions


# Global Gems



#Pacs="$Pacs rvm"                                 # Ruby Version Manager (After reboot => rvm install ruby)
                                                  # The terminal emulator may need to be
                                                  # configured to always run a login shell
##Pacs="$Pacs ruby"                                # TODO: Use rvm || rbenv Instead
