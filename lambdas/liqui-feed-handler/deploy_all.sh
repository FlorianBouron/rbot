#!/bin/bash -e -x

grep "^LIQUI" ../../markets.csv | while IFS=, read -r exchange token currency
do
  ./deploy_one.sh $exchange $token $currency
done
