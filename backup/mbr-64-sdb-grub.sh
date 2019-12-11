#!/bin/sh

#*************************************************************************
# Install MBR grub on the 64 bit partition.
#
# NOTES:
#    Make sure that the partition to install to is mounted on ~/.backup/64.
#    Make sure that the drive to install grub is sdb.
#    Currently this does copy the symlinks, because of the a flag???
#    However, I think this is actually what I want.
#    I use --one-file-system (-x) just incase.
#*************************************************************************

# TODO: Decide if you want to keep using the "&&" or explicitly handle errors.
# TODO: Add tests for a correctly mounted filesystem.
# TODO: Rewrite all of these as make tasks.
# TODO: Add a task to "shread swap and tmp files etc."
#**********
# Fix grub
#**********
# Set up for installation
sudo mount --bind /dev     ~/.backup/64/dev      &&
sudo mount --bind /dev/pts ~/.backup/64/dev/pts  &&
sudo mount --bind /proc    ~/.backup/64/proc     &&
sudo mount --bind /sys     ~/.backup/64/sys      &&
#sudo chroot                ~/.backup/64          &&

#****************************************************************
# NOTES:
# chroot spawns a new shell process so any commands
# after it will not not be executed in the desired environment.
# So, chroot must be used like sudo (ie chroot ~/mnt install.sh).
#****************************************************************

# Install grub
sudo chroot ~/.backup/64 grub-install /dev/sdb            &&
sudo chroot ~/.backup/64 grub-install --recheck /dev/sdb  &&
sudo chroot ~/.backup/64 update-grub                      &&

# Clean up
#exit                       &&
sudo umount ~/.backup/64/sys      &&
sudo umount ~/.backup/64/proc     &&
sudo umount ~/.backup/64/dev/pts  &&
sudo umount ~/.backup/64/dev
sudo umount ~/.backup/64
