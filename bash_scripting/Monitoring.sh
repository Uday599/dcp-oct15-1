[root@scriptbox bash]# free -m
              total        used        free      shared  buff/cache   available
Mem:            990         107         768           6         114         752
Swap:          1023           0        1023

[root@scriptbox bash]# echo $?  -> this tells the status of last process if 0 then success else failed
0

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# monit.sh

#!/bin/bash

echo "#####################################################"
date 
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
   echo "Httpd process is running."
else
   echo "Httpd process is NOT Running."
   echo "Starting the process"
   systemctl start httpd 
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo "#####################################################"
echo 


[root@scriptbox bash]# chmod +x monit.sh
[root@scriptbox bash]# ./monit.sh
#####################################################
Tue Nov 29 04:35:27 UTC 2022
Httpd process is running.
#####################################################

[root@scriptbox bash]# systemctl stop httpd
[root@scriptbox bash]# ./monit.sh
#####################################################
Tue Nov 29 04:35:44 UTC 2022
Httpd process is NOT Running.
Starting the process
Process started successfully.
#####################################################

[root@scriptbox /]# cat /var/run/httpd/httpd.pid
2934


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Scheduling the job through "CronJob" Schrduling


The time and date fields are:

                    field          allowed values
                    -----          --------------
                    minute         0-59
                    hour           0-23
                    day of month   0-31
                    month          0-12 (or names, see below)
                    day of week    0-7 (0 or 7 is Sun, or use names)
                    
                    
# use /bin/sh to run commands, no matter what /etc/passwd says
             SHELL=/bin/sh
             # mail any output to `paul', no matter whose crontab this is
             MAILTO=paul
             #
             # run five minutes after midnight, every day
             5 0 * * *       $HOME/bin/daily.job >> $HOME/tmp/out 2>&1
             # run at 2:15pm on the first of every month -- output mailed to paul
             15 14 1 * *     $HOME/bin/monthly
             # run at 10 pm on weekdays, annoy Joe
             0 22 * * 1-5   mail -s "It's 10pm" joe%Joe,%%Where are your kids?%
             23 0-23/2 * * * echo "run 23 minutes after midn, 2am, 4am ..., everyday"
             5 4 * * sun     echo "run at 5 after 4 every sunday"
             
             
  #####################################
  
[root@scriptbox bash]# crontab -e
no crontab for root - using an empty one
crontab: installing new crontab
[root@scriptbox bash]# systemctl stop httpd

[root@scriptbox bash]# ls var/log/monit_httpd.log
You have mail in /var/spool/mail/root
[root@scriptbox bash]# cat /var/spool/mail/root
From root@scriptbox.localdomain  Tue Nov 29 04:42:02 2022
Return-Path: <root@scriptbox.localdomain>
X-Original-To: root
Delivered-To: root@scriptbox.localdomain
Received: by scriptbox.localdomain (Postfix, from userid 0)
        id 2567F2007343; Tue, 29 Nov 2022 04:42:02 +0000 (UTC)
From: "(Cron Daemon)" <root@scriptbox.localdomain>
To: root@scriptbox.localdomain
Subject: Cron <root@scriptbox> /root/bash/monit.sh & >> /var/log/monit_httpd.log
Content-Type: text/plain; charset=UTF-8
Auto-Submitted: auto-generated
Precedence: bulk
X-Cron-Env: <XDG_SESSION_ID=3>
X-Cron-Env: <XDG_RUNTIME_DIR=/run/user/0>
X-Cron-Env: <LANG=en_US.UTF-8>
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <HOME=/root>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=root>
X-Cron-Env: <USER=root>
Message-Id: <20221129044202.2567F2007343@scriptbox.localdomain>
Date: Tue, 29 Nov 2022 04:42:02 +0000 (UTC)

#####################################################
Tue Nov 29 04:42:02 UTC 2022
Httpd process is NOT Running.
Starting the process
Process started successfully.
#####################################################

[root@scriptbox bash]# ls /var/log/monit_httpd.log
/var/log/monit_httpd.log
You have new mail in /var/spool/mail/root


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#!/bin/bash

echo "#####################################################"
date 
#ls /var/run/httpd/httpd.pid &> /dev/null

if [ -f /var/run/httpd/httpd.pid ]     # checking the file status here directly
then
   echo "Httpd process is running."
else
   echo "Httpd process is NOT Running."
   echo "Starting the process"
   systemctl start httpd 
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo "#####################################################"
echo 



