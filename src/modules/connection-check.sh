#!/bin/sh 

function PingGoogle() {
	ping -q -w1 -c1 google.com &>/dev/null && echo online || echo offline
}
function PingDefaultGateway() {
	ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error
}

function ConnectionCheck() {
	wget -q --spider http://google.com
	
	if [ $? -eq 0 ]; then
		echo "online"
	else
		echo "offline"
	fi
}
