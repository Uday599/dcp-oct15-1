#!/bin/bash

echo "Welcome $USER on $HOSTNAME."
echo "#######################################################"

FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/sda1' | awk '{print $4}')


echo "#######################################################"
echo "Available free RAM is $FREERAM MB"
echo "#######################################################"
echo "Current Load Average $LOAD"
echo "#######################################################"
echo "Free ROOT partiotion size is $ROOTFREE"



[root@scriptbox bash]# ./cmd_sub.sh
-bash: ./cmd_sub.sh: Permission denied
[root@scriptbox bash]# chmod +x cmd_sub.sh
[root@scriptbox bash]# ./cmd_sub.sh
Welcome root on scriptbox.
#######################################################
#######################################################
Available free RAM is 760 MB
#######################################################
Current Load Average 0.01,
#######################################################
Free ROOT partiotion size is 848M
