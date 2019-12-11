#!/bin/sh

#----------------------------------------
# NOTES:
#----------------------------------------
#
# Configure a New Lubuntu >19.10 Install
#
# This needs to be done the first time an rsyc is done because these
# directories are either excluded or ephemeral.
#
# This assumes that the default fmask is 755.
#
# Don't forget to make an /etc/fstab.
#
#----------------------------------------


#----------------------------------------
# Config
#----------------------------------------

newRoot="/home/brian/.backup/os2"
#newRoot="~/.backup/os2"
newHome="/home/brian/.backup/os2/home/brian"
#newHome="~/.backup/os2/home/brian"
#newHome="${newRoot}/home/brian"
shareHome="/home/brian/data/home/brian"
#shareHome="~/data/home/brian"
dotfiles="/home/brian/src/projects/dotfiles"
#dotfiles="~/src/projects/dotfiles"


##----------------------------------------
## Home Directores
##----------------------------------------

##----------------------------------------
## Clean Home Directores
##----------------------------------------

#rm -r "${newHome}/Desktop"
#rm -r "${newHome}/Documents"
#rm -r "${newHome}/Downloads"
#rm -r "${newHome}/Music"
#rm -r "${newHome}/Pictures"
#rm -r "${newHome}/Public"
#rm -r "${newHome}/Templates"
#rm -r "${newHome}/Videos"

##----------------------------------------
## Link Home Directores
##----------------------------------------

#ln -s "${shareHome}/Desktop"   "${newHome}/Desktop"
#ln -s "${shareHome}/Documents" "${newHome}/Documents"
#ln -s "${shareHome}/Downloads" "${newHome}/Downloads"
#ln -s "${shareHome}/Music"     "${newHome}/Music"
#ln -s "${shareHome}/Pictures"  "${newHome}/Pictures"
#ln -s "${shareHome}/Public"    "${newHome}/Public"
#ln -s "${shareHome}/Templates" "${newHome}/Templates"
#ln -s "${shareHome}/Videos"    "${newHome}/Videos"

#ln -s "${shareHome}/src"          "${newHome}/src"
#ln -s "${shareHome}/vim_Sessions" "${newHome}/vim_Sessions"


##----------------------------------------
## Ensure Home Mount Points
##----------------------------------------

#sudo mkdir "${newHome}/data"
#sudo mkdir "${newHome}/os-dev"
#sudo mkdir "${newHome}/archive"


##----------------------------------------
## Link Home Config Files
##----------------------------------------

#ln -s "${dotfiles}/vim"         "${newHome}/.vim"
#ln -s "${dotfiles}/.vimrc"      "${newHome}/.vimrc"
#ln -s "${dotfiles}/backup"      "${newHome}/.backup"
#ln -s "${dotfiles}/.cvsignore"  "${newHome}/.cvsignore"
#ln -s "${dotfiles}/.gitconfig"  "${newHome}/.gitconfig"
#ln -s "${dotfiles}/.jshintrc"   "${newHome}/.jshintrc"
#ln -s "${dotfiles}/.mongorc.js" "${newHome}/.mongorc.js"
#ln -s "${dotfiles}/update.sh"   "${newHome}/update.sh"
# TODO:
#ln -s "${dotfiles}/.gtkrc-2.0"  "${newHome}/.gtkrc-2.0"


#----------------------------------------
# Link App Config Files
#----------------------------------------

# ===>>> Init       <<<===
mkdir "${newHome}/.config"

# TODO: ===>>> gtk-2.0    <<<===
# TODO:        ===>>> ???
# TODO: ===>>> gtk-3.0    <<<===
# TODO:        ===>>> settings.ini
# TODO: ===>>> kcalc

# ===>>> LXQt       <<<===
mkdir "${newHome}/.config/lxqt"
ln -s "${dotfiles}/.config/lxqt/globalkeyshortcuts.conf" "${newHome}/.config/lxqt/globalkeyshortcuts"
ln -s "${dotfiles}/.config/lxqt/lxqt.conf"               "${newHome}/.config/lxqt/lxqt.conf"
ln -s "${dotfiles}/.config/lxqt/panel.conf"              "${newHome}/.config/lxqt/panel.conf"
ln -s "${dotfiles}/.config/lxqt/session.conf"            "${newHome}/.config/lxqt/session.conf"

# TODO: ===>>> mimeapps.list

# ===>>> OpenBox    <<<===
mkdir "${newHome}/.config/openbox"
#mv    "${newHome}/.config/openbox/lxqt-rc.xml"           "${newHome}/.config/openbox/OLD.lxqt-rc.xml.OLD"
ln -s "${dotfiles}/.config/openbox/lxqt-rc.xml"          "${newHome}/.config/openbox/lxqt-rc.xml"

# TODO: ===>>> PCmanFM-Qt <<<===
#mkdir "${newHome}/.config/pcmanfm-qt"
#mkdir "${newHome}/.config/pcmanfm-qt/lxqt"

# ===>>> Q-Terminal <<<===
mkdir "${newHome}/.config/qterminal.org"
cp "${dotfiles}/.config/qterminal.org/qterminal.ini"     "${newHome}/.config/qterminal.org/qterminal.ini"
#ln -s "${dotfiles}/.config/qterminal.org/qterminal.ini" "${newHome}/.config/qterminal.org/qterminal.ini"


# TODO: <<<REMOVED>>>

# TODO: <<<REMOVED>>> ===>>> LxTerminal <<<=== <<<REMOVED>>>
#mkdir "${newHome}/.config/lxterminal"
#ln -s "${dotfiles}/.config/lxterminal/lxterminal.conf" "${newHome}/.config/lxterminal/lxterminal.conf"


##----------------------------------------
## Init Ephemeral Dirs
##----------------------------------------

##sudo mkdir "${newRoot}/dev"

#sudo mkdir ${newRoot}/dev/pts"

##sudo mkdir ${newRoot}/media"
##sudo mkdir ${newRoot}/mnt"
##sudo mkdir ${newRoot}/proc"
##sudo mkdir ${newRoot}/run"
##sudo mkdir ${newRoot}/sys"
##sudo mkdir ${newRoot}/tmp"

## I'm not sure why this didnt' work
##sudo chmod 555 ${newRoot}/{proc,sys}
#sudo chmod 555 "${newRoot}/proc"
##sudo chmod 755 ${newRoot}/proc
#sudo chmod 555 "${newRoot}/sys"
##sudo chmod 755 ${newRoot}/sys
#sudo chmod 777 "${newRoot}/tmp"
