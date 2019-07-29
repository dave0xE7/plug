#!/bin/bash

sshdPort=44000

function command_exists() {
	type "$1" &> /dev/null
}

function random_string() {
	length=${1:-12}
	tr -dc A-Za-z0-9_ < /dev/urandom  | head -c$length | xargs
}


function checkDir() {
	dir=$1
	if [ -d $dir ]; then
		echo "true"
	else
		echo "false"
	fi
}

function checkFile() {
	file=$1
	if [ -f $file ]; then
		echo "true"
	else
		echo "false"
	fi
}

function DebugCheckDir() {
	dir=$1
	if [ -d $dir ]; then
		echo "directory at $dir does exists"
	else
		echo "directory at $dir was not found"
	fi
}
