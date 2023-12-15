#!/bin/bash

echo "Type 1"
person1=$1
person2=$2

echo "$person1: Hi $person2"
echo "$person2: Hi $person1"

echo "Type 2"

echo "Please enter your username :"
read username
echo "Please enter your password :"
read -s password 

echo "The username is $username"
echo "The password is $password"