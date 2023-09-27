#!/bin/bash

# Check if required tools are installed
command -v wrk2 >/dev/null 2>&1 || { echo >&2 "wrk2 is required but not installed. Aborting."; exit 1; }

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START nginx return", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START nginx return"
URL="http://icu0755.devhands.cloud/nginx"
START=50000
END=62000
STEP=1000
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
  -d '{"text": "STOP nginx return", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP nginx return"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START nginx static", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START nginx static"
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

    echo "$rate $rps $latency"
done
curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "STOP nginx static", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP nginx static"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START plain wsgi", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START plain wsgi"
URL="http://icu0755.devhands.cloud/plain_wsgi"
START=1000
END=23000
STEP=1000
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
  -d '{"text": "STOP plain wsgi", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP plain wsgi"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START django", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START django"
URL="http://icu0755.devhands.cloud/"
START=1000
END=2600
STEP=100
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
  -d '{"text": "STOP django", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP django"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START sleep=100", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START sleep=100"
URL="http://icu0755.devhands.cloud/cpu_usleep?sleep=100"
START=20
END=180
STEP=20
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

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START cpu=50", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START cpu=50"
URL="http://icu0755.devhands.cloud/cpu_usleep?cpu=50"
START=10
END=250
STEP=10
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
  -d '{"text": "STOP cpu=50", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP cpu=50"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START db_times=1", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START db_times=1"
URL="http://icu0755.devhands.cloud/from_db?times=1"
START=50
END=1150
STEP=50
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
  -d '{"text": "STOP db_times=1", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP db_times=1"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START db_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START db_times=5"
URL="http://icu0755.devhands.cloud/from_db?times=5"
START=50
END=1150
STEP=50
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
  -d '{"text": "STOP db_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP db_times=5"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START cache_times=1", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START cache_times=1"
URL="http://icu0755.devhands.cloud/from_cache?times=1"
START=50
END=1150
STEP=50
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
  -d '{"text": "STOP cache_times=1", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP cache_times=1"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START cache_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START cache_times=5"
URL="http://icu0755.devhands.cloud/from_cache?times=5"
START=50
END=1150
STEP=50
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
  -d '{"text": "STOP cache_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP cache_times=5"
sleep 300

curl -X POST \
  -H "Authorization: Bearer glsa_hRCH6dgJIWMfcvSQEgl0tnj7MCY5KMhk_a298d46f" \
  -H "Content-Type: application/json" \
  -d '{"text": "START cache_many_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "START cache_many_times=5"
URL="http://icu0755.devhands.cloud/from_cache_many?times=5"
START=50
END=1150
STEP=50
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
  -d '{"text": "STOP cache_many_times=5", "dashboardUID":"L10lV1Xik"}' \
  http://icu0755.devhands.cloud:3000/api/annotations
echo "STOP cache_many_times=5"

# Clean up temporary file
rm tmp_results.txt