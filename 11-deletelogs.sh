#!/bin/bash
source_dir=/tmp/shellscript-logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
if [ ! -d $source_dir ]
then 
   echo -e "$R $source_dir source directory is not available $N"
   exit 1
fi
cd $source_dir

FILES_TO_DELETE=$(find . -type f -mtime +14 -name "*.log")
while IFS=  read -r line
do
  echo "deleting file : $line"
done <<< $FILES_TO_DELETE


