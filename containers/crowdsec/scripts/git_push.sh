#!/bin/bash
# Add this script to cron to run every minute
git add -A
git status       
git commit -m "Updated list"
sleep 5
git push 