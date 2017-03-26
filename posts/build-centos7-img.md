This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Common to all
1. Put vim config in place
2. Put the crontab script to check yum update [script is here](https://github.com/Elgolfin/Blog/blob/master/posts/assets/bash/check-update.md)
   * Edit crontab
     ```bash
     crontab -e
     ```
   * Add the following line
     ```text
     0 */12 * * * /path_to_script/check_update.sh > /dev/null 2>&1
     ```

# Dev machine only
1. Mount NAS
2. NO PASSWD for admin user (me!) when sudoing
   ``` bash
   sudo visudo
   # Add the line:
   # <username> ALL=(ALL) NOPASSWD: ALL
   ```
3. Install Chrome
4. Ensure Development Tools have been installed
5. Install Git
   * yum install git
   * configure (user/authentication/config)
5. Install VirtualBox
   ```
   yum install VirtualBox-5.1
   ```
6. Install Visual Studio Code
   * Import user settings
7. Install node.js
8. Install Ansible


[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)