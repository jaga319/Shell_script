#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


validate(){
    if [ $1 -ne 0 ]
    then
       echo -e "$R Error:$2 is not installed successfully $N"
    else
       echo -e "$G $2 is installed successfully installed $N"
    fi
}
ID=$(id -u)
if [ $ID -ne 0 ]
then 
   echo -e "$R Error : Login to root user $N "
   exit 1
else
  echo " You are in Root user "
fi

for package in $@
do 
   yum list installed $package 
   if [ $? -ne 0 ]
   then 
      yum install $package -y
      validate $? $package
   else
      echo -e "$package is already installed $Y Skipping $N"
    fi
done
      
