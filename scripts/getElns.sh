#!/bin/bash

# targetDir="/var/www/html/staging_eln/knowledge_base/assets"
targetDir="/var/www/html/knowledge_base/assets"

# get the data from the eln-finder

curl -o eln-finder.json "https://eln-finder.ulb.tu-darmstadt.de/server/api/discover/search/objects?sort=dc.title,ASC&f.K03=Chemistry,equals"

curl -o eln-finder-pharm.json "https://eln-finder.ulb.tu-darmstadt.de/server/api/discover/search/objects?sort=dc.title,ASC&f.K03=Pharmacy,equals"

# add current date and time to the json

jq ". + {date: \"$(date -u)\" }" eln-finder.json > $targetDir/elnData.json
jq ". + {date: \"$(date -u)\" }" eln-finder-pharm.json > $targetDir/elnDataPharm.json
