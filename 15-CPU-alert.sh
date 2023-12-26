#!/bin/bash
C=$(top -n 1 -b)
CP=$(echo "$C" | awk '"$1"=="%Cpu(s):" {print $1 " - " $2 }') 
echo "$CP"

