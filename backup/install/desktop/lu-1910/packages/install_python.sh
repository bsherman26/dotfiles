#!/bin/bash

echo "TODO => Installing Python"

Pacs=""

#-----------------------------------------
# Python => Dev
#-----------------------------------------

Pacs="$Pacs python-pip"    # Python 2 Package Installer
Pacs="$Pacs python3-pip"   # Python 3 Package Installer
Pacs="$Pacs python3-venv"  # Python 3 Virtual Environment Binary
#Pacs="$Pacs elpa-pyvenv"   # Python 2 Virtual Environment Interface (138mb)


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs
sudo apt-get install -y $Pacs


#-----------------------------------------
# PIP Update
#-----------------------------------------
PATH="${HOME}/.local/bin:${PATH}"
python -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade pip setuptools wheel

#-----------------------------------------
# Other
#-----------------------------------------

#Pacs="$Pacs python3-pipdeptree"   # TODO: REIVIEW : Display installed package dependency tree
#Pacs="$Pacs python-pip-whl"       # TODO: REIVIEW : Python package installer???
