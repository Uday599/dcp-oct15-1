Shell scripting:
================


	GUI In linux
Gnone , KDE

	CLI
•	sh
•	bash 
•	csh (c shell) and tcsh 
•	ksh (korn shell) – david korn
•	cat /etc/shells = to know the available shells in your system


> A bourne shell (sh) script is a list of lines in a file that are executed in the bourne shell (a forerunner of bash); simplest is just commands that could be run at the prompt.
  The first line in a sh script MUST be   #!/bin/sh

# changing the hostname

vi /etc/hostname
 > scriptbox

[vagrant@scriptbox ~]$ sudo -i
[root@scriptbox ~]# ls
anaconda-ks.cfg  bash  original-ks.cfg
[root@scriptbox ~]# cd bash
[root@scriptbox bash]# ls
firtscript.sh

[root@scriptbox bash]# cat firtscript.sh
 
#!/bin/bash                            ->  this tells the system that navigate to /bin/bash and execute below commands: interpreter : sharp-exclamation, sha-bang, hashbang, pound-bang, or hash-pling.
### This script prints system info ###

echo "Welcome to bash script."
echo

#checking systemt uptime
echo "#####################################"
echo "The uptime of the system is: "
uptime
echo

# Memory Utilization
echo "#####################################"
echo "Memory Utilization"
free -m
echo

# Disk Utilization
echo "#####################################"
echo "Disk Utilization"
df -h




+++++++++++++++++++++++++++++++++++++++++++++++++

[root@scriptbox bash]# ./firtscript.sh        -> relative path
-bash: ./firtscript.sh: Permission denied


######### 	Shell script should have executable permissions( -rwx r-x r-x)

[root@scriptbox bash]# ls -l
total 4
-rw-r--r--. 1 root root 411 Nov 28 06:52 firtscript.sh

[root@scriptbox bash]# chmod  +x firtscript.sh
[root@scriptbox bash]# ls -l
total 4
-rwxr-xr-x. 1 root root 411 Nov 28 06:52 firtscript.sh

[root@scriptbox bash]# ./firtscript.sh

Welcome to bash script.

#####################################
The uptime of the system is:
 06:57:24 up 17 min,  1 user,  load average: 0.00, 0.02, 0.05

#####################################
Memory Utilization
              total        used        free      shared  buff/cache   available
Mem:            990         119         429           6         442         726
Swap:          1023           0        1023

#####################################
Disk Utilization
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 485M     0  485M   0% /dev
tmpfs                    496M     0  496M   0% /dev/shm
tmpfs                    496M  6.7M  489M   2% /run
tmpfs                    496M     0  496M   0% /sys/fs/cgroup
/dev/mapper/centos-root   50G  1.7G   49G   4% /
/dev/sda1               1014M  167M  848M  17% /boot
/dev/mapper/centos-home   28G   33M   28G   1% /home
tmpfs                    100M     0  100M   0% /run/user/1000
