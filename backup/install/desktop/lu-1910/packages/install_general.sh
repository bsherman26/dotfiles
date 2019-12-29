#!/bin/bash

echo "Installing General"

Pacs=""

Pacs="$Pacs curl"

# Proprietary Fonts etc.
Pacs="$Pacs lubuntu-restricted-extras"

# Compression Utilities
Pacs="$Pacs unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract"


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs
sudo apt-get install -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------
#file-roller
