#!/bin/sh

echo "Installing Dev"

Pacs="curl"
Pacs="$Pacs build-essential"
Pacs="$Pacs libssl-dev"

Pacs="$Pacs git"
Pacs="$Pacs gitk"
#Pacs="$Pacs vim-gtk"
Pacs="$Pacs vim-gtk3"
#Pacs="$Pacs vim-gnome"

Pacs="$Pacs dia"
Pacs="$Pacs sqlitebrowser"

#echo $Pacs

sudo apt-get install -y $Pacs
