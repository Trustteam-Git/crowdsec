#!/bin/bash
curl -s -H "X-Api-Key: 32daafbb67bb690f03341cdebd9b7b5e" http://crowdsec:8080/v1/decisions/stream?startup=true  | jq '.new[].value' | sed 's/"//g' > /mnt/output/list.txt