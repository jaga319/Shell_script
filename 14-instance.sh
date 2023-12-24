#!/bin/bash
AMI=ami-03265a0778a880afb
SG=sg-0ef3f217f9042a8d7
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    echo "creating instance : $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCES_TYPE="t3.small"
    else
        INSTANCES_TYPE="t2.micro"
    fi
    if [ ! $i == "web" ] 
    then
    IP_Address=$(aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type $INSTANCES_TYPE --security-group-ids sg-0ef3f217f9042a8d7 --count 1 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
    aws route53 change-resource-record-sets \
    --hosted-zone-id Z0685417SSJQDRXEKNGA \
    --change-batch '
    {
        "Comment": "Testing creating a record set"
        ,"Changes": [{
        "Action"              : "CREATE"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.infome.website"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP_Address'"
            }]
        }
        }]
    }
    '
    else
      IP_Address=$(aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type $INSTANCES_TYPE --security-group-ids sg-0ef3f217f9042a8d7 --count 1 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PublicIpAddress' --output text)
    aws route53 change-resource-record-sets \
    --hosted-zone-id Z0685417SSJQDRXEKNGA \
    --change-batch '
    {
        "Comment": "creating a record set"
        ,"Changes": [{
        "Action"              : "CREATE"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.infome.website"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP_Address'"
            }]
        }
        }]
    }
    '
    fi
done

