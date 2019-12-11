#!/bin/sh

echo "Installing Office"

Pacs="$Pacs inkscape"
Pacs="$Pacs pdfshuffler"
Pacs="$Pacs viewnior"

#echo $Pacs

sudo apt-get install -y $Pacs
