#!/bin/sh

aws-vault exec $1 -- aws s3 ls
