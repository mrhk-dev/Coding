# Most Used Linux commands

## File and Directory Management
#### ls: Lists the contents of a directory.  
Syntax: ls [options] [directory]  
Options: -l (long format), -a (include hidden files), -R (recursive).  
#### cd: Changes the current directory.  
Syntax: cd [directory]  
#### pwd: Prints the current working directory.  
Syntax: pwd  
#### mkdir: Creates a new directory.  
Syntax: mkdir [directory_name]  
#### rmdir: Removes an empty directory.  
Syntax: rmdir [directory_name]  
#### rm: Deletes files or directories.  
Syntax: rm [options] [file_or_directory]  
Options: -r (recursive), -f (force).  
#### cp: Copies files or directories.  
Syntax: cp [options] source destination  
Options: -r (for directories), -i (interactive).  
#### mv: Moves or renames files or directories.  
Syntax: mv [source] [destination]

## System Operations  
#### sudo: Executes commands with superuser privileges.  
#### shutdown: Powers off the system.  
Syntax: shutdown now  
#### reboot: Restarts the system.  

## Process Management  
#### top: Displays real-time information about running processes.  
#### kill: Terminates a process by its PID (process ID).  
Syntax: kill [PID]  
#### htop: An enhanced version of top, providing an interactive process viewer.  

## Networking  
#### ping: Tests connectivity to another host.  
#### ssh: Securely logs into a remote machine.  
Syntax: ssh user@hostname
#### scp: Securely copies files between hosts on a network.  

## Text Processing  
#### grep: Searches for specific patterns within files.  
Syntax: grep [pattern] [file]  
#### cat: Concatenates and displays file content.  
#### less/more: Views file content page by page.  

## Miscellaneous Commands  
#### man: Displays the manual for a command.  
Syntax: man [command]  

#### history: Shows the command history.  
#### . (dot) command to run scripts in the current shell context.  


## USER amd GROUP

#### getent group: view existing groups
#### cat /etc/group: same to view the groups
#### getent group groupname: check if the group with the name exists

#### useradd: to create a user
Syntax: sudo useradd rahmath

#### passwd: to create the password for the user
Syntax: sudo passwd username

#### mkhomedir_helper: to create the home directory for the existing user
Syntax: mkhomedir_helper username

#### groupadd GROUPNAME
Syntax: groupadd groupname

#### groupadd -g 1010 groupname: to create the group with specific groupId 

#### usermod -aG groupname username: add user to the group

### Group permisions:
    * Symbolic Mode
    In symbolic mode, you can use the following operators:
    +: Adds a permission
    -: Removes a permission
    =: Sets the permission and overrides existing ones

```
chmod g=rw filename  # Sets read and write permissions for the group
chmod g+w filename   # Adds write permission for the group
chmod g-r filename   # Removes read permission from the group
```

#### Numeric Mode
* In numeric mode, permissions are represented by numbers:

* 4: Read
* 2: Write
* 1: Execute

```
You sum these values to set permissions. For example:
7 (4+2+1): Read, write, and execute
6 (4+2): Read and write
5 (4+1): Read and execute
```
### Ex:
```
chmod 770 filename  # Sets read, write, execute for owner and group; no permissions for others
```

#### chgrp groupname filename: change the file ownership for group

#### sudo usermod -s /bin/bash username: change the user shell to bash

#### group delete
* before deleting the group, delete users from the group

#### gpasswd -d username groupname

#### sudo userdel username: delete user

#### su - username: change user 


## Enable SSH connection:
#### Install OpenSSH Server:
```bash 
sudo apt install openssh-server -y
```

#### Check SSH Status:
```bash
sudo systemctl status ssh
```

#### Allow SSH Through Firewall (if applicable):
```bash
sudo ufw allow ssh
```

#### Find Your IP Address:
```bash
ip a
```

#### Connect via SSH:
```bash
ssh username@ip_address
```





