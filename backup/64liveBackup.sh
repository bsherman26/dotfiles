#!/bin/sh

#*************************************************************************
# Rsync a running system partition and reconfigure grunt to make that
# partition bootable.
#
# NOTES:
#    Make sure that the partition to sync to is mounted on ~/.backup/data
#    Make sure that the drive to install grub is sdb.
#    Currently this does copy the symlinks, because of the a flag???
#    However, I think this is actually what I want.
#    I use --one-file-system (-x) just incase.
#*************************************************************************

# TODO: Add the ability to reinstall grub here.
# TODO: Decide if you want to keep using the "&&" or explicitly handle errors.
# TODO: Add tests for a correctly mounted filesystem.
# TODO: Rewrite all of these as make tasks.
# TODO: Add a task to "shread swap and tmp files etc."
sudo rsync -aAXv --delete --one-file-system --exclude-from=exclude.txt / ~/.backup/64
#&&

##**********
## Fix grub
##**********
## Set up for installation
#sudo mount --bind /dev     ~/.backup/64/dev      &&
#sudo mount --bind /dev/pts ~/.backup/64/dev/pts  &&
#sudo mount --bind /proc    ~/.backup/64/proc     &&
#sudo mount --bind /sys     ~/.backup/64/sys      &&
##sudo chroot                ~/.backup/64          &&

#****************************************************************
# NOTES:
# chroot spawns a new shell process so any commands
# after it will not not be executed in the desired environment.
# So, chroot must be used like sudo (ie chroot ~/mnt install.sh).
#****************************************************************

## Install grub
#sudo chroot ~/.backup/64 grub-install /dev/sdb            &&
#sudo chroot ~/.backup/64 grub-install --recheck /dev/sdb  &&
#sudo chroot ~/.backup/64 update-grub                      &&

## Clean up
##exit                       &&
#sudo umount ~/.backup/64/sys      &&
#sudo umount ~/.backup/64/proc     &&
#sudo umount ~/.backup/64/dev/pts  &&
#sudo umount ~/.backup/64/dev
##sudo umount ~/.backup/64


#*******
# NOTES
#*******
# Old Way
#sudo rsync -aAXv --delete --one-file-system --exclude={"/home/brian/data/","/home/brian/mnt/","/home/brian/win/","/etc/fstab","/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/lost+found"} / ~/mnt

# Long Version
#sudo rsync --archive --acls --xattrs --one-file-system --verbose --delete --exclude={"/etc/fstab","/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/lost+found"} / ~/mnt

# Short Version
#sudo rsync -aAXxv --delete --exclude={"/etc/fstab","/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/lost+found"} / ~/mnt

# Test example
#rsync -aAXv --delete --exclude="/backup/" ~/src/projects/dotfiles/ ~/src/projects/rsync
