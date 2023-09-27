#!/bin/bash

# Check if required tools are installed
command -v wrk2 >/dev/null 2>&1 || { echo >&2 "wrk2 is required but not installed. Aborting."; exit 1; }

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START sleep=100", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START sleep=100"
URL="http://icu0755.devhands.cloud/cpu_usleep?sleep=100"
START=2
END=20
STEP=1
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$rate $rps $latency"
done
curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "STOP sleep=100", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP sleep=100"
sleep 300

# Clean up temporary file
rm tmp_results.txt