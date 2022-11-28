
here we are passing arguments to variable at run time
-----------------------------------------------------


#!/bin/bash

echo "Value of 0 is "
echo $0

echo "Value of 1"
echo $1

echo "Value of 2"
echo $2

echo "Value of 3"
echo $3


[root@scriptbox bash]# ./args.sh Hey Uday takeCare
Value of 0 is
./args.sh
Value of 1
Hey
Value of 2
Uday
Value of 3


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/





++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
name="Uday"
echo "Hey $name , are you paying \$8 for this course?"

> single quote dont work
> if you want special character $ dummy , then use "\"

















