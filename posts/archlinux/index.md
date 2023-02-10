This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

# **arch**linux

**[Reference documentation](https://wiki.archlinux.org/title/Installation_guide)**

## Installation Steps

> https://archlinux.org/download/  
> https://wiki.archlinux.org/title/USB_flash_installation_medium

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

```bash
iwctl station wlan0 connect SSID\ S
```

### Configure the system clock

```bash
./100-setup-pre-install.sh
```

### Partition the disks

```bash
### Part 0 ###
# Fill the disk with random data (optional)
# Replace sdx with the right disk label
# shred --random-source=/dev/urandom --iterations=1 /dev/sdx

### Part 1 (partitioning) ###
# Replace sdx with the right disk label
./105-setup-pre-install.sh sdx

reboot

### Part 2 (after reboot; encrypting and lvm + installing Arch Linux) ###
# Replace sdx with the right disk label
# Replace the second argument with the desired swap size (if ommited default is 1)
./110-setup-pre-install.sh sdx 1
```

Also see:
- [Arch Linux Setup with Disk Encryption](https://paedubucher.ch/articles/2020-09-26-arch-linux-setup-with-disk-encryption.html)
- [How to use parted on Linux](https://linuxhint.com/parted_linux/)
- [GNU Parted User Manual](https://www.gnu.org/software/parted/manual/html_node/index.html)

### Configure the system

```bash
# Change root into the new system
arch-chroot /mnt
# Replace hostname with the desired hostname
./300-setup-post-install.sh hostname

reboot

# Configure network and wifi (if needed)
./500-setup-first-boot.sh
```

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)
