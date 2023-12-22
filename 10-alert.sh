#!/bin/bash
disk_space=$(df -h)
echo "$disk_space" | tail -n +2 
# D=$(echo "$disk_space" | awk '$5>1 {print $5}' | sed 's/[^0-9]//g')
# for S in $D
# do
# if [ $S -gt 1 ]
# then
#    echo "$disk_space" | awk '$5>1 {print $1 " -" $5}' 
#    echo "The above disk spaces is more than 1% . Please take neccesary action "
# fi
# done