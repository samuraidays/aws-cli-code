# get-aws-resouces

## Preparation
- Install aws-cli
    - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- Install aws-vault
    - https://github.com/99designs/aws-vault

Confirmed to work on macOS

## Installing

```
git clone https://github.com/samuraidays/aws-cli-code.git
```

## Quick start

```
# get EC2 resouces from all region
sh get-ec2-all-region.sh [aws-vault profile name]

# get RDS resources from all region
sh get-rds-all-region.sh [aws-vault profile name]

# get S3 resources from all region
sh get-s3-all-region.sh [aws-vault profile name]

# get lightsail resources from all region
sh get-lightsail-all-region.sh [aws-vault profile name]

# get ec2 keypairs resources from all region
sh get-ec2-keypairs-all-region.sh [aws-vault profile name]

# get ec2 eip resources from all region
sh get-ec2-eip-all-region.sh [aws-vault profile name]

# get ec2 sg resources from all region
sh get-ec2-sg-all-region.sh [aws-vault profile name]
```