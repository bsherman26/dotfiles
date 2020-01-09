#!/bin/bash

echo "Removing Package Applications"

Pacs=""

Pacs="$Pacs snapd"                 # Snap Package Management Damen and Tools
Pacs="$Pacs nano"                  # Text Editor

#-----------------------------------------
# Maybe
#-----------------------------------------

#Pacs="$Pacs gnupg"                 # GNU privacy guard - a free PGP replacement
#Pacs="$Pacs gpgv"                  # GNU privacy guard - Signature Verification Tool

#Pacs="$Pacs curl"                  #
#Pacs="$Pacs wget"                  #

#Pacs="$Pacs busybox-static"        #
#Pacs="$Pacs busybox-initramfs"     #

#Pacs="$Pacs tmux"                  # 
#Pacs="$Pacs screen"                # 

#Pacs="$Pacs gdisk"                 # GPT fdisk text-mode partitioning tool


#-----------------------------------------
# Remove
#-----------------------------------------

#echo $Pacs

sudo apt-get purge -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------
