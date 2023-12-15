#!/bin/bash
ID=$(id -u)
if [ $ID -eq 0 ]
then
   yum install mysql -y
else
   echo "Login to root user and then try"
   exit 1
fi

if [ $? -ne 0 ]
then 
   echo "Error:Installing mysql is failed"
else
   echo "Install mysql successfully"
fi

