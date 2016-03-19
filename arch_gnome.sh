#!/bin/sh

#
# GUI
#
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
#systemctl stop bluetooth.service; sleep 5; systemctl start bluetooth.service
#pactl load-module module-bluetooth-discover