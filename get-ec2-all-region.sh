#!/bin/sh

regions=(`aws-vault exec $1 -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec $1 -- aws ec2 describe-instances --output table --region ${region} \
    --query 'Reservations[*].Instances[*].{
        AZ: Placement.AvailabilityZone,
        STATE: State.Name,
        GIP: join(`, `, NetworkInterfaces[].Association.PublicIp),
        TAG: Tags[?Key==`Name`].Value|[0],
        KEY: KeyName}'
echo "---------------------"
done
