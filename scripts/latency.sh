#!/bin/bash

# Check if required tools are installed
command -v wrk2 >/dev/null 2>&1 || { echo >&2 "wrk2 is required but not installed. Aborting."; exit 1; }

URL="http://icu0755.devhands.cloud/nginx"
START=1000
END=60000
STEP=2000
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

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

    echo "$URL $rate $rps $latency"
done
sleep 300

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

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/cpu_usleep?sleep=1"
START=1
END=20
STEP=1
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

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

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/from_db?times=1"
START=100
END=800
STEP=50
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/from_db?times=5"
START=50
END=400
STEP=50
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/from_cache?times=1"
START=100
END=1400
STEP=100
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/from_cache?times=5"
START=100
END=1400
STEP=100
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

URL="http://icu0755.devhands.cloud/from_cache_many?times=5"
START=100
END=1400
STEP=100
for rate in $(seq $START $STEP $END); do
    # Run wrk2 benchmark and save results
    wrk2 -t4 -c100 -d60s -R "$rate" "$URL" > tmp_results.txt

    # Extract RPS and Latency from results
    rps=$(grep "Requests/sec" tmp_results.txt | awk '{print $2}')
    latency=$(grep "Latency" tmp_results.txt | awk '{print $2}')

    echo "$URL $rate $rps $latency"
done
sleep 300

# Clean up temporary file
rm tmp_results.txt