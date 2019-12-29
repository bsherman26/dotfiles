#!/bin/bash

echo "Installing Office"

Pacs=""

Pacs="$Pacs inkscape"
Pacs="$Pacs pdfshuffler"
#Pacs="$Pacs viewnior"


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs
sudo apt-get install -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------

#Pacs="$Pacs gv"            # PostScript and PDF viewer for X
#Pacs="$Pacs parcellite"    # GTK+ Global Clipboard manager
