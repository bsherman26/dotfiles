#!/bin/bash

#----------------------------------------
# TODO:
#----------------------------------------
#
# Remove unnecessary quotes and test.
#
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

newRoot=${HOME}/.backup/os2
newHome=${newRoot}/home/brian
shareHome=${HOME}/data/home/brian
dotfiles=${HOME}/src/projects/dotfiles

homeDirs=(\
    Desktop\
    Documents\
    Downloads\
    Music\
    Pictures\
    Public\
    Templates\
    Videos\
    src\
    vim_Sessions\
)

homeMountPoints=(\
    data\
    os-dev\
    archive\
    server\
    db\
)

homeDotfiles=(\
    .vimrc\
    .cvsignore\
    .gitconfig\
    .jshintrc\
    .mongorc.js\
    update.sh\
    .gtkrc-2.0\
)


#----------------------------------------
# Root > Ephemeral-Mount-Points > Init
#----------------------------------------

sudo mkdir ${newRoot}/{\
dev{,/pts},\
media,\
mnt,\
proc,\
run,\
sys,\
tmp\
}

sudo chmod 555 ${newRoot}/{proc,sys}
sudo chmod 1777 "${newRoot}/tmp"


#----------------------------------------
# Home Directores
#----------------------------------------


##----------------------------------------
## Home > Dir > Clean
##----------------------------------------
#for i in ${homeDirs[@]}; do

#    rm -r "${newHome}/$i"
#done


#----------------------------------------
# Home > Dirs > Link
#----------------------------------------
for i in ${homeDirs[@]}; do

    ln -s "${shareHome}/$i" "${newHome}/$i"
done


#----------------------------------------
# Home > Mount-Points > Create
#----------------------------------------
for i in ${homeMountPoints[@]}; do

    sudo mkdir "${newHome}/$i"
done


#----------------------------------------
# Home > Config-Files > Link
#----------------------------------------

cp -r "${HOME}/.ssh"       "${newHome}"
ln -s "${dotfiles}/vim"    "${newHome}/.vim"
ln -s "${dotfiles}/backup" "${newHome}/.backup"

for i in ${homeDotfiles[@]}; do

    ln -s "${dotfiles}/$i" "${newHome}/$i"
done


#----------------------------------------
# Home > App > Config-Files
#----------------------------------------

# ===>>> Init       <<<===
mkdir "${newHome}/.config"

# ===>>> gtk-2.0    <<<=== TODO: ABOVE
#ln -s "${dotfiles}/.gtkrc-2.0"                           "${newHome}/.gtkrc-2.0"

# ===>>> gtk-3.0    <<<=== TODO: TEST
mkdir "${newHome}/.config/gtk-3.0"
ln -s {"${dotfiles}","${newHome}"}"/.config/gtk-3.0/settings.ini"
#ln -s "${dotfiles}/.config/gtk-3.0/settings.ini"         "${newHome}/.config/gtk-3.0/settings.ini"

# TODO: ===>>> kcalc      <<<===

# ===>>> LXQt       <<<===
mkdir "${newHome}/.config/lxqt"
ln -s "${dotfiles}/.config/lxqt/globalkeyshortcuts.conf" "${newHome}/.config/lxqt/globalkeyshortcuts.conf"
ln -s "${dotfiles}/.config/lxqt/lxqt.conf"               "${newHome}/.config/lxqt/lxqt.conf"
ln -s "${dotfiles}/.config/lxqt/panel.conf"              "${newHome}/.config/lxqt/panel.conf"
ln -s "${dotfiles}/.config/lxqt/session.conf"            "${newHome}/.config/lxqt/session.conf"

# ===>>> mimeapps.list <<<===
ln -s "${dotfiles}/.config/gtk-3.0/settings.ini"         "${newHome}/.config/gtk-3.0/settings.ini"

# ===>>> OpenBox    <<<===
mkdir "${newHome}/.config/openbox"
#mv    "${newHome}/.config/openbox/lxqt-rc.xml"           "${newHome}/.config/openbox/OLD.lxqt-rc.xml.OLD"
ln -s "${dotfiles}/.config/openbox/lxqt-rc.xml"          "${newHome}/.config/openbox/lxqt-rc.xml"

# ===>>> PCmanFM-Qt <<<===
mkdir "${newHome}/.config/pcmanfm-qt"{,/lxqt}
cp "${dotfiles}/.config/pcmanfm-qt/lxqt/settings.conf"   "${newHome}/.config/pcmanfm-qt/lxqt/settings.conf"

# ===>>> Q-Terminal <<<===
mkdir "${newHome}/.config/qterminal.org"
cp "${dotfiles}/.config/qterminal.org/qterminal.ini"     "${newHome}/.config/qterminal.org/qterminal.ini"
#ln -s "${dotfiles}/.config/qterminal.org/qterminal.ini" "${newHome}/.config/qterminal.org/qterminal.ini"

# ===>>> Terminator <<<===
mkdir "${newHome}/.config/terminator"
ln -s "${dotfiles}/.config/terminator/config"            "${newHome}/.config/terminator/config"


#----------------------------------------
# Etc > Config-Files
#----------------------------------------

# ===>>> Pulse-Audio <<<===
mv "${newRoot}/etc/pulse/default.pa"                     "${newRoot}/etc/pulse/default.pa.dist"
cp "${dotfiles}/etc/pulse/default.pa"                    "${newRoot}/etc/pulse/default.pa"




#----------------------------------------
# TODO: OLD
#----------------------------------------


###----------------------------------------
### Clean Home Directores
###----------------------------------------

##rm -r "${newHome}/Desktop"
##rm -r "${newHome}/Documents"
##rm -r "${newHome}/Downloads"
##rm -r "${newHome}/Music"
##rm -r "${newHome}/Pictures"
##rm -r "${newHome}/Public"
##rm -r "${newHome}/Templates"
##rm -r "${newHome}/Videos"


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

#cp -r "${HOME}/.ssh"            "${newHome}"

#ln -s "${dotfiles}/vim"         "${newHome}/.vim"
#ln -s "${dotfiles}/.vimrc"      "${newHome}/.vimrc"
#ln -s "${dotfiles}/backup"      "${newHome}/.backup"
#ln -s "${dotfiles}/.cvsignore"  "${newHome}/.cvsignore"
#ln -s "${dotfiles}/.gitconfig"  "${newHome}/.gitconfig"
#ln -s "${dotfiles}/.jshintrc"   "${newHome}/.jshintrc"
#ln -s "${dotfiles}/.mongorc.js" "${newHome}/.mongorc.js"
#ln -s "${dotfiles}/update.sh"   "${newHome}/update.sh"
#ln -s "${dotfiles}/.gtkrc-2.0"  "${newHome}/.gtkrc-2.0"


#----------------------------------------
# TODO:
# Link App Config Files
#----------------------------------------

## ===>>> Init       <<<===
#mkdir "${newHome}/.config"

## ===>>> gtk-2.0    <<<=== TODO: ABOVE
##ln -s "${dotfiles}/.gtkrc-2.0"                           "${newHome}/.gtkrc-2.0"

## ===>>> gtk-3.0    <<<=== TODO: TEST
#mkdir "${newHome}/.config/gtk-3.0"
#ln -s "${dotfiles}/.config/gtk-3.0/settings.ini"         "${newHome}/.config/gtk-3.0/settings.ini"

## TODO: ===>>> kcalc

## ===>>> LXQt       <<<===
#mkdir "${newHome}/.config/lxqt"
#ln -s "${dotfiles}/.config/lxqt/globalkeyshortcuts.conf" "${newHome}/.config/lxqt/globalkeyshortcuts"
#ln -s "${dotfiles}/.config/lxqt/lxqt.conf"               "${newHome}/.config/lxqt/lxqt.conf"
#ln -s "${dotfiles}/.config/lxqt/panel.conf"              "${newHome}/.config/lxqt/panel.conf"
#ln -s "${dotfiles}/.config/lxqt/session.conf"            "${newHome}/.config/lxqt/session.conf"

## ===>>> mimeapps.list <<<=== TODO: TEST
#ln -s "${dotfiles}/.config/gtk-3.0/settings.ini"         "${newHome}/.config/gtk-3.0/settings.ini"


## ===>>> OpenBox    <<<===
#mkdir "${newHome}/.config/openbox"
##mv    "${newHome}/.config/openbox/lxqt-rc.xml"           "${newHome}/.config/openbox/OLD.lxqt-rc.xml.OLD"
#ln -s "${dotfiles}/.config/openbox/lxqt-rc.xml"          "${newHome}/.config/openbox/lxqt-rc.xml"

## ===>>> PCmanFM-Qt <<<=== TODO: TEST
#mkdir "${newHome}/.config/pcmanfm-qt"
#mkdir "${newHome}/.config/pcmanfm-qt/lxqt"
#cp "${dotfiles}/.config/pcmanfm-qt/lxqt/settings.conf"   "${newHome}/.config/pcmanfm-qt/lxqt/settings.conf"

## ===>>> Pulse-Audio <<<===
#mv "${newRoot}/etc/pulse/default.pa"                     "${newRoot}/etc/pulse/default.pa.dist"
#cp "${dotfiles}/etc/pulse/default.pa"                    "${newRoot}/etc/pulse/default.pa"

## ===>>> Q-Terminal <<<===
#mkdir "${newHome}/.config/qterminal.org"
#cp "${dotfiles}/.config/qterminal.org/qterminal.ini"     "${newHome}/.config/qterminal.org/qterminal.ini"
##ln -s "${dotfiles}/.config/qterminal.org/qterminal.ini" "${newHome}/.config/qterminal.org/qterminal.ini"

## ===>>> Terminator <<<===
#mkdir "${newHome}/.config/terminator"
#ln -s "${dotfiles}/.config/terminator/config"            "${newHome}/.config/terminator/config"


## TODO: <<<REMOVED>>>

## TODO: <<<REMOVED>>> ===>>> LxTerminal <<<=== <<<REMOVED>>>
##mkdir "${newHome}/.config/lxterminal"
##ln -s "${dotfiles}/.config/lxterminal/lxterminal.conf" "${newHome}/.config/lxterminal/lxterminal.conf"


##----------------------------------------
## TODO:
## Init Ephemeral Dirs
##----------------------------------------

##sudo mkdir "${newRoot}/"{dev{,/pts},media,mnt,proc,run,sys,tmp}

#sudo mkdir "${newRoot}/dev"
#sudo mkdir "${newRoot}/dev/pts"
#sudo mkdir "${newRoot}/media"
#sudo mkdir "${newRoot}/mnt"
#sudo mkdir "${newRoot}/proc"
#sudo mkdir "${newRoot}/run"
#sudo mkdir "${newRoot}/sys"
#sudo mkdir "${newRoot}/tmp"

#sudo chmod 755 "${newRoot}/{proc,sys}"
#sudo chmod 555 "${newRoot}/proc"
##sudo chmod 755 "${newRoot}/proc"
#sudo chmod 555 "${newRoot}/sys"
##sudo chmod 755 "${newRoot}/sys"



##----------------------------------------
## TODO: PLAY
##----------------------------------------

##ln -s {\
#newRoot=${HOME}/.backup/os2
#newHome=${newRoot}/home/brian
#dotfiles=${HOME}/src/projects/dotfiles
#echo "testing "{\
#"${dotfiles}",\
#"${newHome}"\
#}\
#"/.config/lxqt/"\
#{\
#globalkeyshortcuts,\
#lxqt,\
#panel,\
#session\
#}".conf"
