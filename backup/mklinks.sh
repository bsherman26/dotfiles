#!/bin/sh

# Notes:
#    This doesn't need to be done on a backup but these links do need to be
#    created for a fresh install.
#
#    A few of these may need to be deleted before creating the link (ie .vim
#    and the .config Directory Links). Check that these were created properly.
#
#    There are a few links that I need to add to this.

# Home Directory Links
ln -s ~/data/home/brian/src               ~/src
ln -s ~/data/home/brian/vim_Sessions      ~/vim_Sessions
ln -s ~/src/projects/dotfiles/vim         ~/.vim
ln -s ~/src/projects/dotfiles/.vimrc      ~/.vimrc

ln -s ~/src/projects/dotfiles/backup      ~/.backup
ln -s ~/src/projects/dotfiles/.cvsignore  ~/.cvsignore
ln -s ~/src/projects/dotfiles/.gitconfig  ~/.gitconfig
ln -s ~/src/projects/dotfiles/.gtkrc-2.0  ~/.gtkrc-2.0
ln -s ~/src/projects/dotfiles/.jshintrc   ~/.jshintrc
ln -s ~/src/projects/dotfiles/.mongorc.js ~/.mongorc.js

# .config Directory Links
mv ~/.config/openbox/lubuntu-rc.xml ~/.config/openbox/OLD.lubuntu-rc.xml.OLD
ln -s ~/src/projects/dotfiles/.config/openbox/lubuntu-rc.xml ~/.config/openbox/lubuntu-rc.xml

mv ~/.config/lxterminal/lxterminal.conf ~/.config/lxterminal/OLD.lxterminal.conf.OLD
ln -s ~/src/projects/dotfiles/.config/lxterminal/lxterminal.conf ~/.config/lxterminal/lxterminal.conf

mv ~/.config/lxsession/Lubuntu/autostart ~/.config/lxsession/Lubuntu/OLD.autostart.OLD
ln -s ~/src/projects/dotfiles/.config/lxsession/Lubuntu/autostart ~/.config/lxsession/Lubuntu/autostart
