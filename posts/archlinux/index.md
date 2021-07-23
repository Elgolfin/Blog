This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

# **arch**linux

**[Reference documentation](https://wiki.archlinux.org/title/Installation_guide)**

## Installation Steps

> https://archlinux.org/download/

### Download ISO and create the USB bootable key

```bash
# Download the ISO
curl https://mirror.rackspace.com/archlinux/iso/2021.07.01/archlinux-2021.07.01-x86_64.iso --output archlinux-2021.07.01-x86_64.iso

# Download the ISO signature
curl https://archlinux.org/iso/2021.07.01/archlinux-2021.07.01-x86_64.iso.sig --output archlinux-2021.07.01-x86_64.iso.sig

## Verify the signature
gpg --fetch-key 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4aa4767bbc9c4b1d18ae28b77f2d434b9741e8ac' # Must be needed if the next command fails with the `No public key error`
gpg --keyserver-options auto-key-retrieve --verify archlinux-2021.07.01-x86_64.iso.sig
```

> **About the `No public key` error while verifying the signature**
>
> You get that error because you don't have the public key of the person who signed the message.
> 
> gpg should have given you a message containing the ID of the key that was used to sign it. Obtain the public key from the person who encrypted the file and import it into your keyring (gpg2 --import key.asc); you should be able to verify the signature after that.
> 
> If the sender submitted its public key to a keyserver (for instance, https://pgp.mit.edu/), then you may be able to import the key directly from the keyserver:
> 
> ```bash
> gpg2 --keyserver https://pgp.mit.edu/ --search-keys <sender_name_or_address>
> ``` 
> 
> See also:
>- [How to use GPG](https://www.privex.io/articles/what-is-gpg)
>- [GnuPG on **arch**linux](https://wiki.archlinux.org/title/GnuPG)

### Configure the keyboard layout

```bash
# Set keyboard layout ot us intl
loadkeys us-acentos
```

### Configure the wifi

Also see:
- [iwd](https://wiki.archlinux.org/title/Iwd)

```bash
# Create the PWA2 Enterprise Wifi connection configuration
iwctl station wlan0 scan
iwctl station wlan0 get-networks
touch /var/lib/iwd/SSID\ S.8021x
vim SSID\ S.8021x # Add the below content to the file; example as been provided with a SSIS including a space character within
```

> [Security]  
> EAP-Method=MSCHAPv2  
> EAP-Identity=*username*  
> EAP-Password=*password*  
> 
> [Settings]  
> AutoConnect=True  

### Configure the system clock

```bash
# Set the timezone
timedatectl set-timezone America/Toronto
# Enable ntp
timedatectl set-ntp true
# Verify the date and time are correct
timedatectl status
```

### Partition the disks

Also see:
- [Arch Linux Setup with Disk Encryption](https://paedubucher.ch/articles/2020-09-26-arch-linux-setup-with-disk-encryption.html)
- [How to use parted on Linux](https://linuxhint.com/parted_linux/)
- [GNU Parted User Manual](https://www.gnu.org/software/parted/manual/html_node/index.html)

```bash
# Replace sda with the right disk label

# Fill the disk with random data
shred --random-source=/dev/urandom --iterations=1 /dev/sda # replace sda by the targerted disk

# Create the partition table
parted -s /dev/sda mklabel gpt
# Create the efi/boot partition
parted -s /dev/sda mkpart efi fat32 1MiB 257MiB # Leave a gap of 1 MB at the beginning, so no matter what block size my SSD uses, the boot partition will always be properly aligned
parted -s /dev/sda set 1 esp on # The esp flag identifies the partition as a UEFI system partition
# Format the partition
mkfs.fat -F 32 /dev/sda1

# Create the encrypted partition (where all other partitions will be located)
parted -s /dev/sda mkpart cryptlvm 257MiB '100%'

# At this point, it might be needed to reboot so that the kernel is aware of the changes

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
# Mount the boot partition
# Also see: https://serverfault.com/questions/751113/mount-point-does-not-exist-despite-creating-it
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

swapon /dev/volgrp/swap

mount -l # Make sure the efi/boot partition is well-mounted
```

### Install **arch**linux

```bash
pacstrap /mnt base linux linux-firmware intel-ucode lvm2 vim
```

### Configure the system

```bash
# Generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into the new system
arch-chroot /mnt

# Change the root password
passwd

# Configure the Time Zone
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
timedatectl set-ntp true
hwclock --systohc

# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales.
vim /etc/locale.gen

# Generate the locales
locale-gen

# Set the LANG variable
vim /etc/locale.conf
```
> LANG=en_CA.UTF-8

```bash
# Set the keyboard layout
vim /etc/vconsole.conf
```
> KEYMAP=us-actenos

```bash
# Set the hostname
echo myhostname > /etc/hostname

# Install the required network packages
pacman --sync --refresh --noconfirm iwd
cat <<EOF >/etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
EOF
systemctl enable --now iwd systemd-resolved systemd-networkd
iwctl # Manually configure the Wifi

# Configure the bootloader
systemd-machine-id-setup
bootctl --path=/boot install
bootctl status # Check if everything is fine
uuid=$(blkid --match-tag UUID -o value /dev/sda2)

cat <<EOF >/boot/loader/entries/arch.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options cryptdevice=UUID=${uuid}:cryptlvm root=/dev/volgrp/root quiet splash rw
EOF

cat <<EOF >/boot/loader/loader.conf
default arch
timeout 0
editor  0
EOF

# Change the Ramdisk Environment configuration
sed -i -r 's/^HOOKS.+$/HOOKS=(base udev autodetect keyboard modconf block encrypt lvm2 filesystems fsck)/g' /etc/mkinitcpio.conf

# Create the Ramdisk Environment
mkinitcpio -P
```

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)