# Setup the encryption on the partition
cryptsetup luksFormat /dev/sda2 # YES, then enter the passphrase
# Open the partition
cryptsetup open /dev/sda2 cryptlvm
# Create the physical volumne
pvcreate /dev/mapper/cryptlvm
# Create the volume group
vgcreate volgrp /dev/mapper/cryptlvm
# Create and format the remaining partitions
lvcreate -L 16G volgrp -n swap
lvcreate -l '100%FREE' volgrp -n root
mkswap /dev/volgrp/swap
mkfs.ext4 -F /dev/volgrp/root
# Mount the partitions
mount /dev/volgrp/root /mnt

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

swapon /dev/volgrp/swap

pacstrap /mnt base linux linux-firmware intel-ucode lvm2 vim

# Generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab