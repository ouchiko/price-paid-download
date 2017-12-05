#!/bin/bash
#
# Process for obtaining the monthly price-paid dataset.
# - Download dataset.
# - Parse the contents for specific cols
# - Run TermSQL to convert to .db (sqlite)
# - Clean Up.
cd /data && wget "http://prod2.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-monthly-update.txt"
`cat pp-monthly-update.txt | awk -F, '{print $2, $3, $4, $5, $6, $7, $8}' OFS='~~~~'| sed 's/"//g' > pp-processed.txt`
#`tail -100 pp-processed.txt > output.txt`
/runner/termsql/termsql -q -d '~~~~' -c pricegbp,date_purchased,postcode,typ1,typ2,typ3,house,street -i /data/pp-processed.txt -o /data/pp-monthly-update.db && rm /data/*.txt*
