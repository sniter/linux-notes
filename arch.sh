#!/bin/sh

USER_NAME='ilya'
USER_HOSTNAME='asus'
USER_GROUPS='wheel,users'
USER_ENCODING='en_US.UTF-8'
USER_TIMEZONE='Europe/Minsk'
USER_SHELL='/bin/zsh'

# Primary setup
pacman -S vim grub os-prober bash-completion zsh
# Wifi Support
pacman -S dialog wpa_supplicant
# TODO: uncomment line in config: Repace "#en_US.UTF-8 UTF-8" with "en_US.UTF-8 UTF-8"
vim /etc/locale.gen
locale-gen
echo LANG=${USER_ENCODING} > /etc/locale.conf
export LANG=${USER_ENCODING}
ln -s /usr/share/zoneinfo/${USER_TIMEZONE} > /etc/localtime
hwclock --systohc --utc
grub-install --recheck /dev/sdb
grub-mkconfig -o /boot/grub/grub.cfg
echo asus > /etc/hostname
useradd -m -G ${USER_GROUPS} -s ${USER_SHELL} ${USER_NAME}
passwd ${USER_NAME}

# Sudo
pcman -S sudo
# TODO edit visudo: Replace "# %wheel ALL=(ALL) ALL" with "%wheel ALL=(ALL) ALL"
EDITOR=vim visudo

# GUI
pacman -S xorg-server xorg-server-utils gnome
systemctl start gdm.service
systemctl enable gdm.service

# Enabling Bluetooth
pacman -S bluez bluez-utils pulseaudio-bluetooth
modprobe btusb
systemctl start bluetooth.service
systemctl enable bluetooth.service
echo 'Enable=Source,Sink,Media,Socket' > /etc/bluetooth/main.conf
# In case headses suck
#pactl load-module module-bluetooth-discover
#systemctl stop bluetooth.service; sleep 5; systemctl start bluetooth.service

# TODO: Enable AUR

#######################################################################################
## User Specific actions

# Folder structure
mkdir -p bin
mkdir -p projects

# User specific apps
sudo pacman -S git tmux youtube-dl chromium jdk8-openjdk  openssh aria2 tmux wget sublime-text \
     dosfstools exfat-utils ntfs-3g libreoffice-fresh festival festival-english

# Glances
sudo pacman -S glances python-matplotlib python-docker-py

# ZSH Config
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-highlight

# Installing itunes
cd ~/bin
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks; chmod +x winetricks

pacman -S wine lib32-libpulse cabextract
WINEARCH=win32 winecfg
winetricks gdiplus
# TODO: Replace with more adequate command
wget http://www.oldapps.com/itunes.php\?app\=B5B610F48F7FC5430F407E6B316255B1

# Docker
sudo pacman -S docker btrfs-progs lxc docker-compose
sudo usermod -a -G docker ${USER_NAME}
sudo systemctl start docker.service
sudo systemctl enable docker.service

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.3.0
rvm use 2.3.0
gem install tmuxinator

# Development Python 2
sudo pacman -S ansible python2 ipython2 python2-pip python2-numpy python2-psycopg2 python2-matplotlib
sudo pip2 install pgcli

# Sensors
#sudo pacman -S lm_sensors hddtemp

# Cloning projects
#cd ~/projects
#git clone git@github.com:sniter/linux-notes.git
