#!/bin/bash
validate(){
    if [ $1 -ne 0 ]
then 
   echo "Error:Installation $2 is failed"
else
   echo "Installation $2 successfully"
fi
}
ID=$(id -u)
if [ $ID -eq 0 ]
then
   echo "You are the root user"
else
   echo "Error:Login to root user"
   exit 1
fi
   yum install mysql -y

validate $? MYSQL

   yum install git -y
   
validate $? GIT

