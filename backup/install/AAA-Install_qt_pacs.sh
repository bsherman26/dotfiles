#!/bin/sh


#-------------------
# Packages
#-------------------
# TODO:
#
# Chrome:
# Pacs="$Pacs google-chrome-stable"
#
#-------------------

sudo apt-get update -y

cd packages

./install_general.sh
./install_dev.sh
./install_utility.sh
./install_office.sh

./install_node.sh
./install_mongodb.sh
#./install_extra.sh

cd ..


#-------------------
# TODO: OLD
#-------------------


#---------------
# General
#---------------

#Pacs="lubuntu-restricted-extras"
#Pacs="$Pacs unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller"


#---------------
# Development
#---------------

#Pacs="$Pacs curl"
#Pacs="$Pacs build-essential"
#Pacs="$Pacs libssl-dev"

#Pacs="$Pacs git"
#Pacs="$Pacs gitk"
##Pacs="$Pacs vim-gtk"
#Pacs="$Pacs vim-gtk3"
##Pacs="$Pacs vim-gnome"

#Pacs="$Pacs dia"
#Pacs="$Pacs sqlitebrowser"


#---------------
# Utility (GUI)
#---------------

#Pacs="$Pacs bleachbit"
#Pacs="$Pacs xsensors"


#---------------
# Office
#---------------

#Pacs="$Pacs inkscape"
#Pacs="$Pacs pdfshuffler"
#Pacs="$Pacs viewnior"


#---------------
# TODO:
#---------------

#Pacs="$Pacs google-chrome-stable"


#---------------
# REMOVED
#---------------

#Pacs="$Pacs gparted"
#Pacs="$Pacs lxterminal"

#Pacs="$Pacs gv"
#Pacs="$Pacs alarm-clock-applet"
#Pacs="$Pacs clementine"
#Pacs="$Pacs catfish"

#Pacs="$Pacs arandr"               # Screen Config Utility
#Pacs="$Pacs numlockx"             # Num Key Firing Utility

#Pacs="$Pacs parcellite"           # Global Clipboard


#---------------
# Extra
#---------------

#Pacs="$Pacs youtube-dl"     # Youtube Downloader
#Pacs="$Pacs ruby"           # Is this Installed By Default
#Pacs="$Pacs PHP"            # Is this Installed By Default
#Pacs="$Pacs mysql-server"   # This or Download Latest from Website
#Pacs="$Pacs android-sdk"    # Android Dev Env
#Pacs="$Pacs pyew"           # Malware Analysis
#Pacs="$Pacs calibre"        # Ebook Management
#Pacs="$Pacs gimp"           # Gimp



#---------------
# TEST
#---------------

#echo $Pacs


#-------------------
# Install
#-------------------

#sudo apt-get update -y && sudo apt-get install -y $Pacs




#-------------------
# TODO: OLD
#-------------------

#sudo apt-get update -y && sudo apt-get install -y \
    #lubuntu-restricted-extras \
    #curl                      \
    #build-essential           \
    #libssl-dev                \
    #unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller      \
    #git                       \
    #gitk                      \
    #vim-gtk                   \
    #A
    #sqlitebrowser             \
    #bleachbit                 \
    #xsensors                  \
    #pdfshuffler


    ##google-chrome-stable

    ##numlockx                  \
    ##parcellite                \

    ##lxterminal                \
    ##gparted                   \
    ##arandr                    \
    ##alarm-clock-applet        \
