#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"

file="/etc/passwd"

if [ ! -f $file ]
then
    echo "The file $file does not exist"
fi
 
while IFS=":" read -r username password user_id groud_id user_fullname home_dir shell_path
do 
   echo "username: $username"
   echo "user_id:$user_id"
   echo "user_fullname:$user_fullname"
     
done < $file

