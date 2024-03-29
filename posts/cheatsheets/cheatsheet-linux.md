This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Archlinux Boot Rescue Mode

1. Select a boot option and press e
2. Add init=/bin/bash at the end of the line and press enter

# SMB Mount4 po

1. cd /mnt
2. mkdir *dest*
3. id -g *username* (to get the uid -username id)
4. mount -t cifs -o  user,uid=1000,rw,username=*username*,password=*password* //192.168.1.107/path/to/smbserver *dest*
5. ln -s /mnt/*dest* /home/username/*symlinkname*

## Auto-mount
1. vi /etc/auto.master
2. Add the line: /mnt /etc/auto.*dest*
3. vi /etc/auto.*dest*
4. Add the line: *dest*      -fstype=cifs,uid=1000,rw,noperm,user=*username*,password=*password*    ://192.168.1.107/path/to/smbserver
5. /sbin/service autofs enable (service will start at boot time; # *systemctl list-unit-files* to view systemd services)
6. /sbin/service autofs restart

# SSH

## Common

Generate the public key from the private key
```bash
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
```

Get the MD5 signature of an SSH key
```bash
ssh-keygen -lf ~/.ssh/id_rsa -E md5
```

## SSH without typing the password

*(file: ssh-to-host.sh)*
```bash
#!/usr/bin/expect
spawn  ssh user@host
expect "password:"
send "your_password_in_clear\n";
interact
```

# Redirect output

The > operator redirects the output usually to a file but it can be to a device. You can also use >> to append.

If you don't specify a number then the standard output stream is assumed but you can also redirect errors.

```
> file redirects stdout to file
1> file redirects stdout to file
2> file redirects stderr to file
&> file redirects stdout and stderr to file
```

/dev/null is the null device it takes any input you want and throws it away. It can be used to suppress any output.

```bash
hostname -f 2>/dev/null
```

# GParted

```bash
yum install epel-release
yum install gparted
yum install ntfsprogs
```

# rsync

```bash
rsync -avz --delete ~/Documents/dir /dest_dir
```

# Create a swap file

```bash
# fallocate -l 4G /swapfile
dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s
free -m
```

The problem with fallocate(1) is that it uses filesystem ioctls to make the allocation fast and effective, the disadvantage is that it does not physically allocate the space but swapon(2) syscall requires a real space. Reference : https://bugzilla.redhat.com/show_bug.cgi?id=1129205

So instead of using fallocate, use dd

To enable it at boot time, edit /etc/fstab to include the following entry: 
```
/swapfile swap swap defaults 0 0
```

Ref: https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s2-swap-creating-file.html

# Setup a Wifi network

## Find out the wireless name

```bash
$ iw dev
```
## Check if the device is up

```bash
$ ip link show <device_name>
```
*(Look for the word "UP" inside the brackets in the first line of the output. )*

In case it is needed to put the device up
```bash
$ sudo ip link set <device_name> up
```
## Check the connection status
```bash
$ iw <device_name> link
```

## Scan to find out what WiFi network(s) are detected 

```bash
$ sudo /sbin/iw <device_name> scan
```

## Connect to WPA/WPA2 WiFi network. 
```bash
$ sudo -s
[sudo] password for peter: 
$ wpa_passphrase <SSID> >> /etc/wpa_supplicant.conf 
...type in the passphrase and hit enter...

$ sudo wpa_supplicant -B -D wext -i <device_name> -c /etc/wpa_supplicant.conf
```

## Obtain IP address from DHCP
```bash
$ sudo dhclient wlan0

# Use the ip command to verify the IP address assigned by DHCP.
$ ip addr show wlan0
```

## Add default routing rule

```bash
ip route show
$ sudo ip route add default via 192.168.1.254 dev wlan0
```


## Ping external IP address to test the connectivity
```bash
ping 8.8.8.8
```

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)
