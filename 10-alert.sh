#!/bin/bash
disk_space=$(df -h)
echo "$disk_pace" | awk '$5>10 {print $1}'