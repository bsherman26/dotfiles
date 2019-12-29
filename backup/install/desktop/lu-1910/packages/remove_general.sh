#!/bin/bash

echo "Removing Package Applications"

Pacs=""

Pacs="$Pacs 2048-qt"
Pacs="$Pacs fcitx"                 # Flexible Input Method Framework
Pacs="$Pacs trojita"               # IMAP e-mail client
Pacs="$Pacs qtpass"                # Password Manager (Small)
Pacs="$Pacs qlipper"               # Clipboard history applet (Small)

# DEV
#Pacs="$Pacs firefox"
#Pacs="$Pacs compton"               # 3D GUI Composer
#Pacs="$Pacs bluedevil"             # Bluetooth Manager
#Pacs="$Pacs muon"                  # Package Manager GUI
#Pacs="$Pacs k3b"                   # CD/DVD Burning

#Pacs="$Pacs featherpad"            # Qt5 Plain Text Editor
#Pacs="$Pacs lxqt-openssh-askpass"  # OpenSSH user/pw GUI dialog for LXQt


#-----------------------------------------
# Remove
#-----------------------------------------

#echo $Pacs

sudo apt-get purge -y $Pacs



#-----------------------------------------
# REMOVED
#-----------------------------------------
