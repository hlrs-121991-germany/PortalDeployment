#!/bin/bash

# set variables
hostname=$1
protocol=$2

# wait for the app to start
sleep 5 

# ping the app
status_code=$(curl --write-out %{http_code} -Ls --out /dev/null --silent ${protocol}://${hostname}/console/login)

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
	exit 1
fi
