#!/bin/bash
set -ea
pushd $(dirname $0)/.. >/dev/null
source .cloudformation.env

aws --region ${AWS_REGION} cloudformation deploy \
    --stack-name ${ENVIRONMENT_NAME} \
    --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM \
    --template-file ${PWD}/packaged-template.yaml \
    --parameter-overrides \
        KeyName=${KEY_NAME} \
        AMI=${AMI} \
        InstanceType=${INSTANCE_TYPE} \
        Subnets=${SUBNETS} \
        ClusterSize=${CLUSTER_SIZE} \
