#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-security-groups --output table --region ${region} \
    --query 'SecurityGroups[].{
        NAME: GroupName,
        TAG: Tags[?Key==`Name`].Value|[0],
        ID: GroupId
        }' 
echo "---------------------"
done
