#!/bin/bash
echo;
echo "Downloading latest monthly data set"
echo;
cd /data && wget "http://prod2.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-monthly-update.txt"
`cat pp-monthly-update.txt | awk -F, '{print $2, $3, $4, $5, $6, $7, $8}' OFS='\t'| sed 's/"//g' > pp-processed.txt`
/runner/termsql/termsql -c nameOfText,contents -i /data/pp-processed.txt -o /data/pp-monthly-update.db
