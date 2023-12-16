#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


validate(){
    if [ $1 -ne 0 ]
    then
       echo "$R Error:$2 is not installed successfully $N"
    else
       echo "$G $2 is installed successfully installed $N"
    fi
}
if [ $ID -ne 0 ]
then 
   echo "$R Error : Login to root user $N "
   exit 1
else
  echo " You are in Root user "

for pacakage in $@
do 
   yum list install $pacakage 
   if [ $? -ne 0 ]
   then 
      yum install $pacakage -y
      validate $? $pacakage
   else
      echo "$pacakage is already installed $Y Skipping"
    fi
done
      
