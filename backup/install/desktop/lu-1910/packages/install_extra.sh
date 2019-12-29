#!/bin/bash

echo "Installing Extra"

Pacs=""

#----------------------------------------
# Dev
#----------------------------------------


#------------------------
# DB
#------------------------
#Pacs="$Pacs mysql-server"         # This or Download Latest from Website


#------------------------
# Web Servers
#------------------------
#Pacs="$Pacs apache2"              # Apache Web Server
#Pacs="$Pacs nginx"                # Nginx Web Server


#------------------------
# Other
#------------------------
#Pacs="$Pacs android-sdk"          # Android Dev Env
#Pacs="$Pacs compass"              # CSS and SASS fun in Ruby
#Pacs="PHP"                        # PHP
#Pacs="libapache2-mod-php"         # Apache PHP Module
#sudo systemctl restart apache2    # If you want it to work without restart



#------------------------
# Editing etc.
#------------------------
Pacs="$Pacs gnome-clocks"         # Simple Gnome App with stopwatch, timer, and world clock
#Pacs="$Pacs pyew"                 # Malware Analysis


#------------------------
# Media
#------------------------
Pacs="$Pacs youtube-dl"           # Youtube Downloader
Pacs="$Pacs calibre"              # Ebook Management
#Pacs="$Pacs gimp"                 # Gimp
#Pacs="$Pacs handbrake"            # DVD ripper and video transcoder
#Pacs="$Pacs clementine"           # Music Player (Dead?)


#-----------------------------------------
# Install
#-----------------------------------------

#echo $Pacs
sudo apt-get install -y $Pacs



#-----------------------------------------
# TODO: Timers
#-----------------------------------------
#Pacs="$Pacs gtimer"               # Task Timer and Tracker (Interesting)
#Pacs="$Pacs gnome-shell-timer"    # (142 MB) GNOME Shell Extension providing a countdown timer in the top panel


#-----------------------------------------
# REMOVED
#-----------------------------------------

#Pacs="$Pacs alarm-clock-applet"
