#!/bin/bash

basePath=$(pwd)
baseFile=$0

ls -la $basePath
chmod a+rx $baseFile

function ssh-auto-keygen() {
	filename=${1:-"id_rsa"}
	ssh-keygen -b 4096 -f $filename -P '' -o
}
function ssh-client-user-setup() {
	cd ~
	if [ ! -d .ssh ]; then
		mkdir .ssh
		touch .ssh/config
	fi
	if [ ! -e .ssh/id_rsa ]; then
		ssh-auto-keygen .ssh/id_rsa
	fi
}
function CreateStartupFile() {
	fileStartup="/usr/bin/plug.sh"
	echo '#!/bin/sh

	while [ true ]; do
		echo "loop $(date +%s)"
		#date > /root/disk_space_report.txt
		#du -sh /home/ >> /root/disk_space_report.txt
		sleep 5
	done
	' > $fileStartup
	chmod 744 $fileStartup
	# ls -la $fileStartup
}
function CreateSystemdFile() {
	fileSystemd="/etc/systemd/system/plug.service"
	echo "[Unit]
	Description=PLUG
	
	[Service]
	Type=simple
	ExecStart=/usr/bin/plug.sh
	
	[Install]
	WantedBy=default.target 
	" > $fileSystemd
	chmod 644 $fileSystemd
	# ls -la $fileSystemd
}
function InitSystemdService() {
	systemctl daemon-reload
	systemctl enable plug.service
	systemctl start plug.service

	systemctl status plug.service
}
function UserAction() {
	ssh-client-user-setup
}
function RootAction() {
	CreateStartupFile
	CreateSystemdFile
	InitSystemdService
}
if [ $EUID -ne 0 ]; then
	echo "Run this script as root or sudo user!"
	UserAction
else
	RootAction
fi
