#!/bin/bash
disk_usage=$(df -h | grep -vE 'temp|file')
echo "$disk_usage"