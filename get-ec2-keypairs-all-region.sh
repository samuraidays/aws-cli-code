#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-key-pairs --output table --region ${region} \
    --query 'KeyPairs[*].{
        ID: KeyPairId,
        NAME: KeyName
        }'
echo "---------------------"
done
