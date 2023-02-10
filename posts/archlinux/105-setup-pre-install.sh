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

DISK_LABEL=$1

# Replace sda with the right disk label

# Fill the disk with random data
# shred --random-source=/dev/urandom --iterations=1 /dev/{$1}

# Create the partition table
parted -s /dev/${DISK_LABEL} mklabel gpt
# Create the boot/efi partition
parted -s /dev/${DISK_LABEL} mkpart efi fat32 1MiB 512MiB # Leave a gap of 1 MB at the beginning, so no matter what block size my SSD uses, the boot partition will always be properly aligned
parted -s /dev/${DISK_LABEL} set 1 esp on # The esp flag identifies the partition as a UEFI system partition
# Format the partition
mkfs.fat -F 32 /dev/${DISK_LABEL}1

# Create the encrypted partition (where all other partitions will be located)
parted -s /dev/sda mkpart cryptlvm 512MiB '100%'

# At this point, it might be needed to reboot so that the kernel is aware of the changes
echo "*****************************************************************"
echo -e "${WHITE}Please reboot for the changes to be applied${NOCOLOR}"
echo "*****************************************************************"