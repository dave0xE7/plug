#!/bin/bash

while [ true ]; do

	sleep 10
	timestamp=$(date +%s)
	printf "%s/n" "plug log $timestamp"

done
