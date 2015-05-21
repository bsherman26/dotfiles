#!/bin/sh

# Notes:
#
#     This needs to be done the first time an rsyc is done because these
#     directories are either excluded or ephemeral.
#
#     This assumes that the default fmask is 755.
#
#     Don't forget to make an /etc/fstab.

sudo mkdir ~/.backup/32/dev
sudo mkdir ~/.backup/32/dev/pts
sudo mkdir ~/.backup/32/media
sudo mkdir ~/.backup/32/mnt
sudo mkdir ~/.backup/32/proc
sudo mkdir ~/.backup/32/run
sudo mkdir ~/.backup/32/sys
sudo mkdir ~/.backup/32/tmp

# I'm not sure why this didnt' work
#sudo chmod 555 ~/.backup/32/{proc,sys}
sudo chmod 555 ~/.backup/32/proc
sudo chmod 555 ~/.backup/32/sys
sudo chmod 777 ~/.backup/32/tmp

sudo mkdir ~/.backup/64/dev
sudo mkdir ~/.backup/64/dev/pts
sudo mkdir ~/.backup/64/media
sudo mkdir ~/.backup/64/mnt
sudo mkdir ~/.backup/64/proc
sudo mkdir ~/.backup/64/run
sudo mkdir ~/.backup/64/sys
sudo mkdir ~/.backup/64/tmp

#sudo chmod 555 ~/.backup/64/{proc,sys}
sudo chmod 555 ~/.backup/64/proc
sudo chmod 555 ~/.backup/64/sys
sudo chmod 777 ~/.backup/64/tmp
