#!/bin/bash
set -ea
pushd $(dirname $0)/.. >/dev/null
source .cloudformation.env

aws --region ${AWS_REGION} cloudformation create-stack \
    --stack-name ${ENVIRONMENT_NAME} \
    --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM \
    --template-body file://${PWD}/packaged-template.yaml \
    --stack-policy-body file://${PWD}/stack-policy.json \
    --parameters \
        ParameterKey=EnvironmentName,ParameterValue=${ENVIRONMENT_NAME} \
        ParameterKey=VPC,ParameterValue=${VPC} \
        ParameterKey=KeyName,ParameterValue=${KEY_NAME} \
        ParameterKey=AMI,ParameterValue=${AMI} \
        ParameterKey=InstanceType,ParameterValue=${INSTANCE_TYPE} \
        ParameterKey=Subnets,ParameterValue=\'${SUBNETS}\' \
        ParameterKey=ClusterSize,ParameterValue=${CLUSTER_SIZE} \
