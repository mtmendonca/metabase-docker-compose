#!/bin/bash
set -eak
pushd $(dirname $0)/.. >/dev/null
source .cloudformation.env

aws cloudformation package --template ${PWD}/master.yaml \
    --s3-bucket ${AWS_CF_S3_BUCKET} \
    --output-template-file packaged-template.yaml

./bin/validate-templates.sh ${1}