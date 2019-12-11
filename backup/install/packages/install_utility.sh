#!/bin/sh

echo "Installing Utility"

Pacs="bleachbit"
Pacs="$Pacs xsensors"

#echo $Pacs

sudo apt-get install -y $Pacs
