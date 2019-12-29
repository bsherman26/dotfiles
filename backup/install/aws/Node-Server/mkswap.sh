#!/bin/sh


#---------------------------------
# TODO:
# 
# TODO: Add size param etc.
#
# TODO: Mount the swapfile on ecrypfs
#
# TODO: Seed the swapfile with encrypted characters rather than /dev/zero
#
#---------------------------------


#---------------------------------
# Make a swapfile
#---------------------------------
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024  # Create File
sudo mkswap /swapfile  # Format Swap File
sudo swapon /swapfile  # Turn on swap temporarily


#---------------------------------
# TODO:
# Add to /etc/fstab
#---------------------------------

