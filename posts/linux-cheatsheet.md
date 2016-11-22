This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

SMB Mount
=====================

1. cd /mnt
2. mkdir *dest*
3. id -g *username* (to get the uid -username id)
4. mount -t cifs -o  user,uid=1000,rw,username=*username*,password=*password* //192.168.1.107/path/to/smbserver *dest*
5. ln -s /mnt/*dest* /home/username/*symlinkname*

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)