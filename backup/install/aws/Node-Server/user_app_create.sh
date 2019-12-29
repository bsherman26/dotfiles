#!/bin/sh


# Ensure App Name Param (Param 1)
NAME=$1
if [ -z "${NAME+xxx}" ] || [ -z "$NAME" -a "${NAME+xxx}" = "xxx" ]; then
    echo "App name parameter not defined."
    exit 0;
fi


# Add App User
sudo adduser ${NAME}
sudo chmod 0750 /home/${NAME}
