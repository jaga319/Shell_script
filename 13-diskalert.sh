#!/bin/bash
disk_usage=$(df -hT |grep -vE 'tmp|file')
echo "$disk_usage"
