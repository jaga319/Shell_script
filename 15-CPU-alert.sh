#!/bin/bash
C=$(top -n 1 -b)
host=$(hostnmae -i)
CP=$(echo "$C" | awk '$1=="%Cpu(s):" {print $2 }') 

if [ $CP -ge 0 ]
then 
  echo "$host is High CPU $CP% PLEASE CHECK"
else
  echo "CPU % IS FINE " 
fi

# echo "$CP"

# CP=$(echo "$C" | awk '{print $1 }') -- %Cpu(s):
