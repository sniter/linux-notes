#!/bin/bash

# Folder structure
mkdir -p bin
mkdir -p projects

# User specific apps
sudo pacman -S git tmux youtube-dl chromium jdk8-openjdk openssh aria2 tmux wget sublime-text \
     dosfstools exfat-utils ntfs-3g libreoffice-fresh festival festival-english htop

#
# ZSH Config
#
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-highlight

#
# Itunes
#
cd ~/bin
aria2 https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks; chmod +x winetricks

pacman -S wine lib32-libpulse cabextract
WINEARCH=win32 winecfg
winetricks gdiplus
cd ~/Downloads
aria2 http://www.oldapps.com/itunes.php\?app\=B5B610F48F7FC5430F407E6B316255B1
wine ./iTunesSetup_1211.exe


# Docker
# sudo pacman -S docker btrfs-progs lxc docker-compose
# sudo usermod -a -G docker ${USER_NAME}
# sudo systemctl start docker.service
# sudo systemctl enable docker.service

# # RVM
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable
# rvm install 2.3.0
# rvm use 2.3.0
# gem install tmuxinator

# Development Python 2
sudo pacman -S ansible python2 python2-pip
sudo pip2 install virtualenv pgcli