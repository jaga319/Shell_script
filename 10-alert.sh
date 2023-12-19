#!/bin/bash
disk_space=$(df -h)
echo "$disk_space" | awk '$5>90 {print $1}'  
echo "$?"