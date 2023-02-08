#!/bin/sh
regions=(`aws-vault exec $1 -- aws rds describe-source-regions --query 'SourceRegions[].RegionName' --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws rds describe-db-instances --query 'DBInstances[].[{ID:DBInstanceIdentifier,Class:DBInstanceClass,Engine:Engine}]' --output text --region ${region} | column -t
echo "---------------------"
done