#!/bin/bash

sshdPort=44000

function command_exists() {
	type "$1" &> /dev/null
}

function random_string() {
	length=${$1:-12}
	tr -dc A-Za-z0-9_ < /dev/urandom  | head -c$length | xargs
}
