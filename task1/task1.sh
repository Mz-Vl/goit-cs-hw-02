#!/bin/bash

# websites' array
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# log file
logfile="website_status.log"

#Clean log file
> $logfile

# Check if web site is available and record results in the log files
for site in "${websites[@]}"; do
    response=$(curl -o /dev/null -s -L --head -w "%{http_code}\n" "https://google.com" | grep 200)
    if [ "$response" == "200" ]; then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
done

# Finish message
echo "Results is written to the: $logfile"
