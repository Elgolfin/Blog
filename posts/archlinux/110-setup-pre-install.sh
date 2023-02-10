#!/bin/bash

# https://linuxhandbook.com/change-echo-output-color/
WHITE='\033[1;37m'
RED='\033[0;31m'
NOCOLOR='\033[0m'

# $1 is the name of the disk passed in argument
# $2 is the size of the swap (in GB) passed in argument (default: 1)

if [ -z "$1" ]
then
     echo ""
     echo "*****************************************************************"
     echo -e "${RED}You need to pass the name of the disk in parameter${NOCOLOR}"
     echo "*****************************************************************"
     echo ""
     fdisk -l
     echo ""
     echo "*****************************************************************"
     echo -e "${WHITE}Please choose one from the list above (generated with fdisk -l)${NOCOLOR}"
     echo "*****************************************************************"
     echo ""
     exit 1
fi

if [ -z "$2" ]
then
     echo "*****************************************************************"
     echo -e "${WHITE}No swap size has been provided. Will default to 1G.${NOCOLOR}"
     echo "*****************************************************************"
     $2=1
fi

DISK_LABEL=$1
SWAP_SIZE=$2

# Setup the encryption on the partition
cryptsetup luksFormat /dev/${DISK_LABEL}2 # YES, then enter the passphrase
# Open the partition
cryptsetup open /dev/${DISK_LABEL}2 cryptlvm
# Create the physical volumne
pvcreate /dev/mapper/cryptlvm
# Create the volume group
vgcreate volgrp /dev/mapper/cryptlvm
# Create and format the remaining partitions
lvcreate -L ${SWAP_SIZE}G volgrp -n swap
lvcreate -l '100%FREE' volgrp -n root
mkswap /dev/volgrp/swap
mkfs.ext4 -F /dev/volgrp/root
# Mount the partitions
mount /dev/volgrp/root /mnt

mkdir /mnt/boot
mount /dev/${DISK_LABEL}1 /mnt/boot

swapon /dev/volgrp/swap

pacstrap /mnt base linux linux-firmware intel-ucode lvm2 vim

# Generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab