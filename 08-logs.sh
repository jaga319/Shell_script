#!/bin/bash
Date=$(date +%F-%H-%M-%S)
LOG_File="/tmp/$0-$Date.log"
R="\e[31m"
N="\e[0m"
validate(){
    if [ $1 -ne 0 ]
then 
   echo -e "$R Error:$N Installation $2 is failed"
else
   echo "Installation $2 successfully"
fi
}
ID=$(id -u)
if [ $ID -eq 0 ]
then
   echo "script name : $0 "
   echo "You are the root user"
else
   echo -e "$R Error:$n Login to root user"
   exit 1
fi
   yum install mysql -y &>> $LOG_File

validate $? MYSQL

   yum install git -y &>> $LOG_File
   
validate $? GIT

