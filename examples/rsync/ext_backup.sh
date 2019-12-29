#!/bin/sh

##########################################
# NOTES:
#
# Mount the Device to backup to on ./mnt.
#
# The files will be saved to the:
#     Survey_Database_Backup Directory.
##########################################

sudo rsync -aAXv --one-file-system ./ ./mnt/Survey_Database_Backup
#sudo rsync -aAXv --one-file-system --dry-run ./ ./.mnt/Survey_Database_Backup
#sudo rsync -aAXv --delete --one-file-system ./ ~/.mnt
