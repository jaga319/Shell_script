#!/bin/bash
disk_space=$(df -h)
D=$(echo "$disk_space" | awk '$5>0 {print $5}' | sed 's/[^0-9]//g')
echo "$D"
# if [ $D -gt 10 ]
# then
#    echo "$disk_space" | awk '$5>10 {print $1 " - " $5}' 
#    echo "$D"
#    echo "The above disk space is more than 90% . Please take neccesary action "
# fi