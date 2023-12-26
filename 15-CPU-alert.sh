#!/bin/bash
# C=$(top -n 1 -b)
# host=$(hostname)
# CP=$(echo "$C" | awk '$1=="%Cpu(s):" { print int($2) }')
# if [ $CP -gt 2 ];then 
#   echo "$host is High CPU $CP% PLEASE CHECK"
# else
#   echo "CPU % IS FINE " 
# fi

# echo "$CP"
# # echo "$host"
# # echo "$C"

# # CP=$(echo "$C" | awk '{print $1 }') -- %Cpu(s):

C=$(top -n 1 -b)
host=$(hostname)
CP=$(echo "$C" | awk '/^%Cpu\(s\):/ {gsub(/,/, ""); print int($2)}' 2>/dev/null || echo 0)

echo "Host: $host"
echo "Top Output:"
echo "$C"
echo "CPU Percentage: $CP"

if [ "$CP" -gt 90 ]; then 
  echo "$host is High CPU $CP% PLEASE CHECK"
else
  echo "CPU % IS FINE" 
fi
