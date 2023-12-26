#!/bin/bash
C=$(top -n 1 -b)
CP=$(echo "$C" | awk '$2>90 {print $1 " - " $2 }') 
echo "$CP"

