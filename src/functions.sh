 #!/bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
 
function idk.() {
	
	
	echo "hello"
	printf "%s\n" "Text in ${red}red${end}, white and ${blu}blue${end}."
}

function idk.asd() {
	echo "hello asd"
}

function idk.v0() {
	echo $0
}

