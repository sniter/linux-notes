#!/bin/sh

# Primary setup
pacman -S grub os-prober bash-completion
# Wifi Support
pacman -S dialog wpa_supplicant
# Must-have tools
pacman -S vim zsh git

#######################################################################################
# GRUB install
#######################################################################################
grub-install --recheck ${BOOT_DEVICE}
grub-mkconfig -o ${GRUB_CFG_FILE}

#######################################################################################
# Language & Locale
#######################################################################################
echo "${USER_ENCODING} ${USER_CHARSET}" >> /etc/locale.gen
locale-gen
echo LANG=${USER_ENCODING} > /etc/locale.conf
export LANG=${USER_ENCODING}
localectl set-locale LANG=${USER_ENCODING}

#######################################################################################
# Timezone
#######################################################################################
ln -sfn /usr/share/zoneinfo/${USER_TIMEZONE} > /etc/localtime
timedatectl set-timezone ${USER_TIMEZONE}

#######################################################################################
# Time sync
#######################################################################################
hwclock --systohc --utc
timedatectl set-ntp true

#######################################################################################
# Host
#######################################################################################
echo ${USER_HOSTNAME} > /etc/hostname

#######################################################################################
# Creating User
#######################################################################################
useradd -m -G ${USER_GROUPS} -s ${USER_SHELL} ${USER_NAME}
echo ${USER_PASSWORD} | passwd ${USER_NAME} --stdin

#######################################################################################
# Sudo
#######################################################################################
pacman -S sudo
# EDITOR=vim visudo
if [ -f "/etc/sudoers.tmp" ]; then
    exit 1
fi
touch /etc/sudoers.tmp
edit_sudoers /tmp/sudoers.new
echo "%wheel ALL=(ALL) ALL" >> /tmp/sudoers.new
visudo -c -f /tmp/sudoers.new
if [ "$?" -eq "0" ]; then
    cp /tmp/sudoers.new /etc/sudoers
fi
rm /etc/sudoers.tmp

#######################################################################################
# Specific Configurations
#######################################################################################
cat << EOF > ${PACMAN_FILE}

# Sniter Options
Color

[multilib]
Include = /etc/pacman.d/mirrorlist

EOF


####################################################################################### 
# AUR & yaourt
#######################################################################################
cat << EOF > ${PACMAN_FILE}

[archlinuxfr]
Server = http://repo.archlinux.fr/x86_64

EOF
pacman -S yaourt

