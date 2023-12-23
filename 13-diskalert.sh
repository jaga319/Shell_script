#!/bin/bash
disk_usage=$(df -hT | grep -vE 'tmp|File')
# message="The disk space is more than $thresold% . Please take neccesary action "
while IFS= read  line 
do
    useage=$(echo $line| awk '{print $6F}'|cut -d % -f1)
    filesystem=$(echo "$line" | awk '{print $1F}')
    if [ $useage -ge 1 ]
    then 
       echo "HIGH DISK USAGE $filesystem : $useage"
    fi
done <<< $disk_usage