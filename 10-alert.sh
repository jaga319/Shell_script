#!/bin/bash
disk_space=$(df -h)

echo "$disk_space is more than 90% . Please take neccesary action " | awk '$5>10 {print $1}'