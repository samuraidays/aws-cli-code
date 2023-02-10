#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-security-groups --query 'SecurityGroups[].[GroupName, Tags[?Key==`Name`].Value|[0], GroupId]' --output text --region ${region} | column -t
echo "---------------------"
done
