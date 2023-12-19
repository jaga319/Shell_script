#!/bin/bash
disk_space=$(df -h)
echo "$disk_space" | awk '$5>10 {print $1}'