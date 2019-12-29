#!/bin/bash


#----------------------------------
# Two ways to:
#     Append a Here Document to a File
#         - Redirection on first line.
#         - Grouping and redirection after grouping.
#
# NOTES:
#   - Quoting or Escaping the
#     "limit string" (EOF) at the head of a here document
#     disables parameter substitution within its body.
#       - As documented in Advanced Bash-Scripting Guide:
#         http://tldp.org/LDP/abs/html/here-docs.html
#
#----------------------------------

OUTFILE=test.txt


#----------------------------------
# First Line
#----------------------------------
#cat <<'EOF' >> ${OUTFILE}


## Source Custom
#if [ -f "${HOME}"/.bashbas ]; then

    #. "${HOME}"/.bashbas
#fi
#EOF


#----------------------------------
# Grouping
#
# As documented in Advanced Bash-Scripting Guide:
# http://tldp.org/LDP/abs/html/here-docs.html
#
#----------------------------------
#(
#cat <<'EOF'


## Source Custom
#if [ -f "${HOME}"/.bashbas ]; then

    #. "${HOME}"/.bashbas
#fi
#EOF
#) >> ${OUTFILE}


#----------------------------------
# Variable
#
# As documented in Advanced Bash-Scripting Guide:
# http://tldp.org/LDP/abs/html/here-docs.html
#
#----------------------------------
#STR=$(cat <<'EOF'


## Source Custom
#if [ -f "${HOME}"/.bashbas ]; then

    #. "${HOME}"/.bashbas
#fi
#EOF
#)
#echo "${STR}" >> ${OUTFILE}
##echo -e "${STR}" >> ${OUTFILE}
## The "-e" is only necessary when using \n as in:
##echo -e '\n\n# Source Custom\nif [ -f "${HOME}"/.bashbas ]; then\n\n    . "${HOME}"/.bashbas\nfi' >> ${HOME}/.bashrc
## But, the variables does need to be quoted when referenced by echo.




#----------------------------------
# Literal File Name
#----------------------------------


#----------------------------------
# First Line (Literal File Name)
#----------------------------------
#cat <<'EOF' >> test.txt


## Source Custom
#if [ -f "${HOME}"/.bashbas ]; then

    #. "${HOME}"/.bashbas
#fi
#EOF


#----------------------------------
# Grouping (Literal File Name)
#----------------------------------
#(
#cat <<'EOF'


## Source Custom
#if [ -f "${HOME}"/.bashbas ]; then

    #. "${HOME}"/.bashbas
#fi
#EOF
#) >> test.txt
