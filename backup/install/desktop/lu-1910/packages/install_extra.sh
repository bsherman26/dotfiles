#!/bin/bash

#-----------------------------------------
echo "Installing Extra"
#-----------------------------------------
#echo $(tmp=(
sudo apt-get install -y $(tmp=(


    #----------------------------------------
    # TODO:
    # Dev
    #----------------------------------------

        #------------------------
        # Dev > DB
        #------------------------
        #mysql-server         # This or Download Latest from Website

        #------------------------
        # Dev > Web Servers
        #------------------------
        #apache2              # Apache Web Server
        #nginx                # Nginx Web Server

        #------------------------
        # Dev > Other
        #------------------------
        #android-sdk          # Android Dev Env
        #compass              # CSS and SASS fun in Ruby


    #----------------------------------------
    # Other
    #----------------------------------------

        #------------------------
        # Editing etc.
        #------------------------
        gnome-clocks         # Simple Gnome App with stopwatch, timer, and world clock
        #pyew                 # Malware Analysis

        #------------------------
        # Media
        #------------------------
        youtube-dl           # Youtube Downloader
        calibre              # Ebook Management
        #gimp                 # Gimp
        #handbrake            # DVD ripper and video transcoder
        #clementine           # Music Player (Dead?)

); echo ${tmp[@]})




#------------------------
# TODO:
# PHP
#------------------------
#Pacs="PHP"                        # PHP
#Pacs="libapache2-mod-php"         # Apache PHP Module
#sudo systemctl restart apache2    # If you want it to work without restart




#-----------------------------------------
# TODO: Timers
#-----------------------------------------
#Pacs="$Pacs gtimer"               # Task Timer and Tracker (Interesting)
#Pacs="$Pacs gnome-shell-timer"    # (142 MB) GNOME Shell Extension providing a countdown timer in the top panel


#-----------------------------------------
# REMOVED
#-----------------------------------------

#Pacs="$Pacs alarm-clock-applet"
