#!/bin/bash

# Check if required tools are installed
command -v wrk2 >/dev/null 2>&1 || { echo >&2 "wrk2 is required but not installed. Aborting."; exit 1; }

URL="http://icu0755.devhands.cloud/50x.html"
START=1000
END=30000
STEP=1000
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done