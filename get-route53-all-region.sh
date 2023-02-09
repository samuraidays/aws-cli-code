#!/bin/sh

# output is recordname and recordcount
aws-vault exec $1 -- aws route53 list-hosted-zones --query 'HostedZones[].[Name, ResourceRecordSetCount]' --output text | column -t