#!/bin/sh

aws-vault exec $1 -- aws s3api list-buckets --output table \
    --query 'Buckets[*].{NAME: Name}'
