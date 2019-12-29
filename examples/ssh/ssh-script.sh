#!/bin/bash

if [ -r $2 ] && [ -x $2 ]; then

    COM=`cat $2`
    ssh -tt $1 "$COM"
fi


#-------------------
# GOOD Also
#-------------------
#SCRIPT=`cat script.sh`;ssh -t app "$SCRIPT"

#-------------------
# GOOD Also
# Execute Local Script on Remote Server
#-------------------
# NOTE: A single "-t" also works, "-tt" Forces Pseudo-Terminal Allocation
#com=`cat script.sh`;ssh -t app "$com"
#com=`cat script.sh`;ssh -tt app "$com"
#com=`cat update.sh`;ssh -tt app "$com"



#-------------------
# BAD
#-------------------

#COM="sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y"

#ssh -tt app "$COM"
