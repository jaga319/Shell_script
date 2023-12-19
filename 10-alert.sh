#!/bin/bash
disk_space=$(df -h)
D=awk '$5>10 {print $5}'
if [ $D -gt 10 ]
then
   echo "$disk_space" | awk '$5>10 {print $1}' 
   echo "The above disk space is more than 90% . Please take neccesary action "
fi