#!/bin/bash

#-----------------------------------------
echo "Removing Package Applications"
#-----------------------------------------
#echo $(tmp=(
#sudo apt-get purge $(tmp=(
sudo apt-get purge -y $(tmp=(


    2048-qt
    #fcitx                 # TODO: (Maybe not???) Flexible Input Method Framework
    trojita               # IMAP e-mail client
    qtpass                # Password Manager (Small)
    qlipper               # Clipboard history applet (Small)


    # TODO: DEV

    #firefox
    #compton               # 3D GUI Composer
    #bluedevil             # Bluetooth Manager
    #muon                  # Package Manager GUI
    #k3b                   # CD/DVD Burning

    #featherpad            # Qt5 Plain Text Editor
    #lxqt-openssh-askpass  # OpenSSH user/pw GUI dialog for LXQt

); echo ${tmp[@]})
