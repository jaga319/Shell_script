#!/bin/bash
disk_usage=$(df -hT | grep -vE 'tmp|File')
# message="The disk space is more than $thresold% . Please take neccesary action "
FLAG1="FALSE"
FLAG2="TRUE"
message=""
while IFS= read  line 
do
    useage=$(echo $line| awk '{print $6F}'|cut -d % -f1)
    filesystem=$(echo "$line" | awk '{print $1F}')
    if [ $useage -ge 1 ]
    then 
       FLAG1="TRUE"
       $message+=echo "$filesystem : $useage \n"
    fi
done <<< $disk_usage

if [ "$FLAG1" == "$FLAG2" ]
then
   message2="please check above disk spaces are more than 1%"
   echo "$message \n $message2" | mail -s "High Disk Space Usage" mummadijagadeesh219@gmail.com
else 
   echo "All disk spaces are fine" | mail -s "High Disk Space Usage" mummadijagadeesh219@gmail.com
fi