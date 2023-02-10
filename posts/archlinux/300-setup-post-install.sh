#!/bin/bash

# https://linuxhandbook.com/change-echo-output-color/
WHITE='\033[1;37m'
RED='\033[0;31m'
NOCOLOR='\033[0m'

### Partition the disks
# $1 is the name of the disk passed in argument

if [ -z "$1" ]
then
     echo ""
     echo "*****************************************************************"
     echo -e "${RED}You need to pass the hostname in parameter${NOCOLOR}"
     echo "*****************************************************************"
     echo ""
     exit 1
fi

HOSTNAME=$1

# Change the root password
passwd

# Configure the Time Zone
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
timedatectl set-ntp true
hwclock --systohc

# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales.
sed -i -r 's/^#en_CA.UTF-8 UTF-8/en_CA.UTF-8 UTF-8/g' /etc/locale.gen
sed -i -r 's/^#fr_CA.UTF-8 UTF-8/fr_CA.UTF-8 UTF-8/g' /etc/locale.gen

# Generate the locales
locale-gen

# Set the LANG variable
cat <<EOF >/etc/locale.conf
LANG=en_CA.UTF-8
EOF

# Set the keyboard layout
cat <<EOF >/etc/vconsole.conf
KEYMAP=us-acentos
EOF

# Set the hostname
echo ${HOSTNAME} > /etc/hostname

# Install the required network packages
pacman --sync --refresh --noconfirm iwd

# Configure the bootloader
systemd-machine-id-setup
bootctl --path=/boot install
bootctl status # Check if everything is fine
uuid=$(blkid --match-tag UUID -o value /dev/sda2)

touch /boot/loader/entries/arch.conf
cat <<EOF >/boot/loader/entries/arch.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options cryptdevice=UUID=${uuid}:cryptlvm root=/dev/volgrp/root quiet splash rw
EOF

touch /boot/loader/loader.conf
cat <<EOF >/boot/loader/loader.conf
default arch
timeout 0
editor  0
EOF

# Change the Ramdisk Environment configuration
sed -i -r 's/^HOOKS.+$/HOOKS=(base udev autodetect keyboard modconf block encrypt lvm2 filesystems fsck)/g' /etc/mkinitcpio.conf
# Create the Ramdisk
mkinitcpio --allpresets
