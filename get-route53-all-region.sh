#!/bin/sh

# output is recordname and recordcount
aws-vault exec $1 -- aws route53 list-hosted-zones --output table \
    --query 'HostedZones[].{
        NAME: Name,
        RECODENUM: ResourceRecordSetCount
        }'