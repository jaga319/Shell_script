#!/bin/bash
C=$(top)
CP=$(echo "$C" | awk '$2>90 {print $1 " - " $2 }') 
echo "$CP"

