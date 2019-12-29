#!/bin/bash

echo "Installing Dev"

Pacs=""

Pacs="$Pacs build-essential"
Pacs="$Pacs libssl-dev"

Pacs="$Pacs terminator"
#Pacs="$Pacs screen"

Pacs="$Pacs git"
Pacs="$Pacs gitk"

Pacs="$Pacs vim-gtk3"
Pacs="$Pacs ctags"
#Pacs="$Pacs devscripts"  # TODO: Scripts to make the life of a Debian Package maintainer easier
                         # TODO: REVIEW

Pacs="$Pacs dia"
Pacs="$Pacs sqlitebrowser"


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs
sudo apt-get install -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------
#Pacs="$Pacs screen"
#Pacs="$Pacs vim-gtk"
#Pacs="$Pacs vim-gnome"
