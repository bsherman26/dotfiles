#!/bin/sh


# Ensure App Name Param (Param 1)
NAME=$1
if [ -z "${NAME+xxx}" ] || [ -z "$NAME" -a "${NAME+xxx}" = "xxx" ]; then
    echo "App name parameter not defined."
    exit 0;
fi

echo "App Name = ${NAME}"

## Ensure Param One ($1) Defined and Non-Empty
#if [ -z "${1+xxx}" ] || [ -z "$1" -a "${1+xxx}" = "xxx" ]; then
    #echo "Param 1 is not defined"
    #exit 0;
#fi

#echo "Param 1 = ${1}"


## Ensure Param One ($1) Defined
#if [ $1 ]; then
    #echo "Param 1 = ${1}"
#fi
