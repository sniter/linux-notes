#!/bin/sh

USER_NAME='ilya'
USER_PASSWORD='1'
USER_HOSTNAME='asus'
USER_GROUPS='wheel,users'
USER_LOCALE='en_US'
USER_CHARSET='UTF-8'
USER_ENCODING="${USER_LOCALE}.${$USER_CHARSET}"
USER_TIMEZONE='Europe/Minsk'
USER_SHELL='/bin/zsh'
BOOT_DEVICE='/dev/sdb'
GRUB_CFG_FILE='/boot/grub/grub.cfg'
PACMAN_FILE='/etc/pacman.conf'
