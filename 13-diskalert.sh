#!/bin/bash
disk_usage=$(df -hT |grep -vE 'temp|file')
echo "$disk_usage"
