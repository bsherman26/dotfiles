#!/bin/bash

echo "Installing Utility"

Pacs=""

#-----------------------------------------
# File Systems
#-----------------------------------------
Pacs="$Pacs exfat-fuse exfat-utils"       # Micro SD Cards etc.
Pacs="$Pacs sshfs"                        # Filesystem client based on ssh
Pacs="$Pacs s3ql"                         # File system for online data storage

#-----------------------------------------
# Command Line
#-----------------------------------------
Pacs="$Pacs tree"
Pacs="$Pacs extundelete"

#-----------------------------------------
# PDF to DjVu + Recommended Dependencies (Command Line)
#-----------------------------------------
Pacs="$Pacs exiv2 graphicsmagick gettext pdf2djvu"

#-----------------------------------------
# GUI
#-----------------------------------------
Pacs="$Pacs xdiskusage"
Pacs="$Pacs bleachbit"
Pacs="$Pacs xsensors"


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs

sudo apt-get install -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------

#Pacs="$Pacs lubi"         # Linux Distro Installer???
#Pacs="$Pacs catfish"      # GUI File Searching Tool

#-----------------------------------------
# REPLACED
#-----------------------------------------

#Pacs="$Pacs gparted"
#Pacs="$Pacs lxterminal"

#Pacs="$Pacs arandr"       # Screen Config Utility
#Pacs="$Pacs numlockx"     # Num Key Firing Utility

#-----------------------------------------
# DEFAULT
#-----------------------------------------

