#!/bin/bash

#-----------------------------------------
echo "Installing General"
#-----------------------------------------
#echo $(tmp=(
sudo apt-get install -y $(tmp=(

    curl

    # Proprietary Fonts etc.
    lubuntu-restricted-extras

    # Compression Utilities
        unace
        unrar
        zip
        unzip
        p7zip-full
        p7zip-rar
        sharutils
        rar
        uudeview
        mpack
        arj
        cabextract
        #file-roller

); echo ${tmp[@]})
