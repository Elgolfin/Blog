This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# apt-get

## Repos-related commands

> List the repos
```bash
sudo apt-cache policy
```

> Add a repo
```bash
sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ saucy universe multiverse"
```

> Remove a repo
```bash
sudo add-apt-repository --remove <ppa:whatever/ppa>
```

## Maintenance commands

> Update the source list
```bash
sudo apt-get update
```

> Upgrade all installed packages
```bash
sudo apt-get upgrade
```

> Upgrade all installed packages with a 'smart' conflict resolution system 
```bash
sudo apt-get dist-upgrade
```

## Information commands

> List packages
```bash
dpkg --get-selections | grep -v deinstall
```

> Get a package version
```bash
sudo apt-cache policy <package_name>
```

> List packages with updates 
```bash
sudo apt-get -u upgrade
```

## Installation commands

> Install a new package 
```bash
sudo apt-get install <package_name>
sudo apt-get install -y <package_name>
```

> Install multiple packages 
```bash
sudo apt-get install <package1_name> <package2_name> <package3_name>
```

> This command searches the repositories and installs the build dependencies for 'package_name'  
```bash
sudo apt-get build-dep <package_name>
```

> Remove a package 
```bash
sudo apt-get remove <package_name> # keep the configuration files
sudo apt-get purge <package_name>  # also remove the configuration files
```

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)
