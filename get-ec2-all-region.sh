regions=(`aws-vault exec takashi@liveserver -- aws ec2 describe-regions --query Regions[*].RegionName --output text`)

for region in ${regions[@]}
do echo "[${region}]"
aws-vault exec takashi@liveserver -- aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, join(`, `, NetworkInterfaces[].Association.PublicIp), Tags[?Key==`Name`].Value|[0]]' --output text --region ${region}
echo "---------------------"
done
