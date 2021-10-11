#!/bin/bash

set -e

if [[ "${AWS_PROFILE}" == "" ]]; then
    echo "Need to choose AWS profile before credentials can be fetched" >&2
    exit 1
fi

if [[ "$1" == "get" ]]; then
    secret-tool lookup awscli ${AWS_PROFILE}
elif [[ "$1" == "store" ]]; then
    read -p "Enter AWS Access Key: " A
    read -p "Enter AWS Secret Key: " S
    echo "{\"Version\":1,\"AccessKeyId\":\"$A\",\"SecretAccessKey\":\"$S\"}" | secret-tool store --label="AWS Credentials for ${AWS_PROFILE}" awscli ${AWS_PROFILE}
else
    echo "Usage: awscred.sh <get|store>" >&2
    exit 1
fi
