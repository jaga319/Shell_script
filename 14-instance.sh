#!/bin/bash

AMI=ami-03265a0778a880afb
SG=sg-0ef3f217f9042a8d7
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    echo "creating instance : $i"
    if [ "$i" == "mongodb" ] || [ "$i" == "mysql" ] || [ "$i" == "shipping" ]
    then
        INSTANCES_TYPE="t3.small"
    else
        INSTANCES_TYPE="t2.micro"
    fi 
    # aws ec2 run-instances --image-id AMI --count 1 --instance-type $INSTANCES_TYPE  --security-group-ids SG 
    aws ec2 run-instances --image-id $AMI --count 1 --instance-type $INSTANCES_TYPE --security-group-ids $SG --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value="$i"}]"
done