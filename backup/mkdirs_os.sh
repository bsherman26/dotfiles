#!/bin/sh

# Notes:
#
#     This needs to be done the first time an rsyc is done because these
#     directories are either excluded or ephemeral.
#
#     This assumes that the default fmask is 755.
#
#     Don't forget to make an /etc/fstab.

sudo mkdir ~/.backup/os2/dev
sudo mkdir ~/.backup/os2/dev/pts
sudo mkdir ~/.backup/os2/media
sudo mkdir ~/.backup/os2/mnt
sudo mkdir ~/.backup/os2/proc
sudo mkdir ~/.backup/os2/run
sudo mkdir ~/.backup/os2/sys
sudo mkdir ~/.backup/os2/tmp

# I'm not sure why this didnt' work
#sudo chmod 555 ~/.backup/32/{proc,sys}
sudo chmod 555 ~/.backup/os2/proc
sudo chmod 555 ~/.backup/os2/sys
sudo chmod 777 ~/.backup/os2/tmp

sudo mkdir ~/.backup/os2/dev
sudo mkdir ~/.backup/os2/dev/pts
sudo mkdir ~/.backup/os2/media
sudo mkdir ~/.backup/os2/mnt
sudo mkdir ~/.backup/os2/proc
sudo mkdir ~/.backup/os2/run
sudo mkdir ~/.backup/os2/sys
sudo mkdir ~/.backup/os2/tmp

#sudo chmod 555 ~/.backup/64/{proc,sys}
sudo chmod 555 ~/.backup/os2/proc
sudo chmod 555 ~/.backup/os2/sys
sudo chmod 777 ~/.backup/os2/tmp
