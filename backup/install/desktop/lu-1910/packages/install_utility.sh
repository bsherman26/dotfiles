#!/bin/bash

#-----------------------------------------
echo "Installing Utility"
#-----------------------------------------
#echo $(tmp=(
sudo apt-get install -y $(tmp=(


    #-----------------------------------------
    # File Systems
    #-----------------------------------------
    exfat-fuse           # exFat driver for FUSE (Micro SD Cards etc.)
        exfat-utils
    sshfs                # Filesystem client based on ssh
    s3ql                 # File system for online data storage

    #-----------------------------------------
    # Command-Line
    #-----------------------------------------
    tree
    extundelete

    #-----------------------------------------
    # PDF to DjVu + Recommended Dependencies (Command Line)
    #-----------------------------------------
    exiv2 graphicsmagick gettext pdf2djvu

    #-----------------------------------------
    # GUI
    #-----------------------------------------
    xdiskusage
    bleachbit
    xsensors


    #-----------------------------------------
    # REMOVED
    #-----------------------------------------

    #lubi         # Linux Distro Installer???
    #catfish      # GUI File Searching Tool

    #-----------------------------------------
    # REPLACED
    #-----------------------------------------

    #gparted
    #lxterminal

    #arandr       # Screen Config Utility
    #numlockx     # Num Key Firing Utility

); echo ${tmp[@]})
