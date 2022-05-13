#!/bin/bash
curl -s -H "X-Api-Key: ae5008d7f011231dfc7dc01760f22b55" http://crowdsec:8080/v1/decisions/stream?startup=true  | jq '.new[].value' | sed 's/"//g' > /mnt/output/list.txt