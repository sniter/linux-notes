#!/bin/sh

parted ${MAIN_DEVICE} mklabel msdos  
parted ${MAIN_DEVICE} mkpart primary ext4 0% 100%
parted ${MAIN_DEVICE} set 1 boot on

mount "${MAIN_DEVICE}1" /mnt

vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt