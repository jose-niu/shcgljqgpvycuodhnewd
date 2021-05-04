#!/bin/bash

if [ $# -ne 1 ]; then
    >&2 echo "ONLY ONE PARAMETER: ec2 name tag"
    exit 1
fi
EC2_PUBLIC_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${1} --query Reservations[*].Instances[*].[PublicIpAddress] --output text)
[[ ! -z "${EC2_PUBLIC_IP}" ]] && ssh ec2-user@"${EC2_PUBLIC_IP}" || >&2 echo Host not found
