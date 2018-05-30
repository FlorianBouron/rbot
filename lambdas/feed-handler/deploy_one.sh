#!/bin/bash -e -x
#
# EXCHANGE=$1
# TOKEN=$2
# CURRENCY=$3
NAME=FEED-HANDLER
#
# echo "creating lambda" $NAME

aws lambda delete-function --function-name $NAME 2>/dev/null || echo "function non-existant"
aws lambda create-function \
  --region us-east-1 \
  --runtime nodejs6.10 \
  --role arn:aws:iam::554285174758:role/dynamodb-writer \
  --handler build/index.handler \
  --code S3Bucket=dewmrax-lambdas-2,S3Key=universal-feed-handler.zip \
  --memory-size 128 \
  --timeout 3 \
  --function-name $NAME \
