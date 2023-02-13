#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-addresses --query 'Addresses[].[PublicIp, InstanceId]|[0]' --output text --region ${region}
echo "---------------------"
done
