#!/bin/bash
disk_space=$(df -h)
D=$(echo "$disk_space" | awk '$5>1 {print $5}' | sed 's/[^0-9]//g')
for S in $D
do
if [ $S -gt 1 ]
then
   echo "$disk_space" | awk '$5>1 {print $1 " -" $5}' 
   echo "The above disk spaces is more than 1% . Please take neccesary action "
fi
done


#!/bin/bash

# disk_space=$(df -h)

# # Use a while loop to read lines of the df output
# Flag=F
# echo "$disk_space" | while read -r line; do
#     # Extract the filesystem and percentage values
#      filesystem=$(echo "$line" | awk '{print $1}')
#      percentage=$(echo "$line" | awk '{print $5}' | sed 's/[^0-9]//g')

#      # Check if the percentage is greater than 1
#      if [ "$percentage" -gt 0 ]; then
#          FLAG=T
#          echo "$filesystem - $percentage%"
         
#    #      echo "The above disk space is more than 1%. Please take necessary action."
#      fi
# done
