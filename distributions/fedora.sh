#!/bin/bash

# Common deps
sudo dnf install -y htop glances vlc vim git zsh aria2 youtube-dl ffmpeg tmux 

## Install Zsh deps
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-highlight

# Install python deps
sudo dnf install -y python python-pip rpm-build

## Upgrade pip
sudo pip install --upgrade pip
sudo python -m pip install virtualenv

## Install Percol
sudo pip install percol

## Install Ranger
sudo dnf install -y highlight atool caca-utils poppler-utils ranger

## Install Xonsh 
sudo dnf install -y python3-devel 
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install prompt-toolkit jupyter setproctitle distro xonsh

## Выключение Selinux
sudo sed -i.bak s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
