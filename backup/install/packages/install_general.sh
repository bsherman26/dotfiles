#!/bin/sh

echo "Installing General"

Pacs="lubuntu-restricted-extras"
Pacs="$Pacs unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller"

#echo $Pacs

sudo apt-get install -y $Pacs
