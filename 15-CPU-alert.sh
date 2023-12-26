#!/bin/bash
C=$(top -n 1 -b)
host=$(hostname)
CP=$(echo "$C" | awk '$1=="%Cpu(s):" {print int($2) }')
if [ $CP -gt 90 ];then 
  echo "$host is High CPU $CP% PLEASE CHECK"
else
  echo "CPU % IS FINE " 
fi

# echo "$CP"
# echo "$host"
# echo "$C"

# CP=$(echo "$C" | awk '{print $1 }') -- %Cpu(s):
