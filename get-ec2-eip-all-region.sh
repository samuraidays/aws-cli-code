#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-addresses --output table --region ${region} \
    --query 'Addresses[*].{
        GIP: PublicIp,
        Instance: InstanceId
        }'
echo "---------------------"
done
