#!/bin/sh

# NOTES:
#    Make sure that the partition to sync to is mounted on ~/.backup/data

# Rsync the whole partition
# However, I think this is actually what I want.
# I use --one-file-system (-x) just incase.
# TODO: Decide if you want all .swp and .swo files included. In this case you
#       would need to only sync while all files are closed. This might end up
#       making sense to do with Chrome. I'm not sure yet.
# TODO: Consider checking if there is a lockfile and including the journal
#       files if there is.
# TODO: Add tests for a correctly mounted filesystem.
# TODO: Rewrite all of these as make tasks.
# TODO: Add a task to "shread swap and tmp files etc."
sudo rsync -aAXv --delete --one-file-system --exclude-from=dataExclude.txt ~/data/ ~/.backup/data


# Old Version
#sudo rsync -aAXv --delete --one-file-system --exclude="/mongodb/journal/" ~/data/ ~/.backup/data
