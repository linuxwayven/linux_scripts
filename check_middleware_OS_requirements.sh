#!/bin/bash
#
#       Author: Jesus A. Ruiz           Date: 09/07/2015
#
#       Description: Script to check Linux System before install middleware software
#
#       Version: V1.0 - The Beginning
#
####################################################################
HOST_NAME="$(hostname)"
SCRIPT_TITLE="Script to check Linux System before install middleware software"
RESULT_FILE_NAME="./check_middleware_requirements_results_"$HOST_NAME".txt"
KDUMP_PATH="/var/crash/"

# First, clean the screen
clear

echo $SCRIPT_TITLE
echo ""
echo "Results file name:" $RESULT_FILE_NAME
echo ""

#Check if the result file exists
if [ -f $RESULT_FILE_NAME ]; then
        echo -n "The result file exist! Do you want replace it? [Y/N]:"
        read ANSWER
        if [ "$ANSWER" == 'Y' ]; then
                echo -n "Deleting old archive..."
                rm -f $RESULT_FILE_NAME
                # Check command's results
                if [ $? -eq 0 ]
                then
                        echo "Done"
                else
                        echo -n "Error deleting file.. exiting"
                        exit -1;
                fi
        else
                echo ""
                echo "Using file:" $RESULT_FILE_NAME
        fi
fi

echo ""
echo "Gathering Information... "
date
date >> $RESULT_FILE_NAME

echo "--------------- Hostname -----------------"
echo "--------------- Hostname -----------------" >> $RESULT_FILE_NAME
echo hostname
hostname >> $RESULT_FILE_NAME

#We create server promtp
SERVER_PROMPT="[oracle@"$(hostname)" ~]#"
echo ""
echo -n "Prompt created:" $SERVER_PROMPT
echo ""
echo ""

echo "--------------- SHMMAX Parameter --------------------"
echo "--------------- SHMMAX Parameter --------------------" >> $RESULT_FILE_NAME
echo "/sbin/sysct kernel.shmmax"
echo "/sbin/sysct kernel.shmmax" >> $RESULT_FILE_NAME
/sbin/sysctl  kernel.shmmax >> $RESULT_FILE_NAME

echo "--------------- Disk Space --------------------------"
echo "--------------- Disk Space --------------------------" >> $RESULT_FILE_NAME
echo "df -h"
echo "df -h" >> $RESULT_FILE_NAME
df -h >> $RESULT_FILE_NAME

echo "--------------- Memory --------------------------"
echo "--------------- Memory --------------------------" >> $RESULT_FILE_NAME
echo "free -g"
echo "free -g" >> $RESULT_FILE_NAME
free -g >> $RESULT_FILE_NAME

echo "--------------- CPU ------------------------"
echo "--------------- CPU ------------------------" >> $RESULT_FILE_NAME
echo "more /proc/cpuinfo"
echo "more /proc/cpuinfo" >> $RESULT_FILE_NAME
more /proc/cpuinfo >> $RESULT_FILE_NAME

echo "--------------- Network Interfaces -----"
echo "--------------- network Interfaces -----" >> $RESULT_FILE_NAME
echo "/sbin/ifconfig  -a"
echo "/sbin/ifconfig  -a" >> $RESULT_FILE_NAME
/sbin/ifconfig  -a >> $RESULT_FILE_NAME

echo "--------------- hosts file ----------------------"
echo "--------------- hosts file ----------------------" >> $RESULT_FILE_NAME
echo "more /etc/hosts"
echo "more /etc/hosts" >> $RESULT_FILE_NAME
more /etc/hosts >> $RESULT_FILE_NAME

echo "--------------- Unicode Support ------------"
echo "--------------- Unicode Support ------------" >> $RESULT_FILE_NAME
echo "locale"
echo "locale" >> $RESULT_FILE_NAME
locale >> $RESULT_FILE_NAME

echo "---------------  Operating System Open File and Processes Limit --------------------------"
echo "---------------  Operating System Open File and Processes Limit --------------------------" >> $RESULT_FILE_NAME
echo "grep -e 'soft  nofile' -e 'hard  nofile' -e 'soft  nproc' -e 'hard  nproc' /etc/security/limits.conf"
echo "grep -e 'soft  nofile' -e 'hard  nofile' -e 'soft  nproc' -e 'hard  nproc' /etc/security/limits.conf" >> $RESULT_FILE_NAME
grep -e 'soft  nofile' -e 'hard  nofile' -e 'soft  nproc' -e 'hard  nproc' /etc/security/limits.conf >> $RESULT_FILE_NAME

echo "--------------- Kernel Version --------------------------"
echo "--------------- Kernel Version --------------------------" >> $RESULT_FILE_NAME
echo "uname -a"
echo "uname -a" >> $RESULT_FILE_NAME
uname -a >> $RESULT_FILE_NAME

echo "--------------- Packages Installed  -----------"
echo "--------------- Packages Installed -----------" >> $RESULT_FILE_NAME
echo "rpm -qi <package_name>"
echo "rpm -qi <package_name>" >> $RESULT_FILE_NAME
rpm -qi binutils  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi compat-libcap  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi compat-libstdc++  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi gcc  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi gcc-c++  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi glibc  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi glibc-devel  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libaio  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libaio-devel  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libgcc  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libstdc++  >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libstdc++-devel >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi libXext >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi openmotif >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
echo "<--------**********************--------->" >> $RESULT_FILE_NAME
echo " " >> $RESULT_FILE_NAME
rpm -qi sysstat >> $RESULT_FILE_NAME

echo ""
echo "Thanks!! - linuxwayven.. "
exit 0;
