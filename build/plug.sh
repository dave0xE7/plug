#!/bin/bash

basePath=$(pwd)
baseFile=$0

ls -la $basePath
chmod a+rx $baseFile

source utils.sh

function sshd-setup() {
	apt-get install openssh-server -y
	systemctl enable sshd
	systemctl start sshd
	sshd_config=/etc/ssh/sshd_config
	echo "Port 22" >> $sshd_config
	echo "ListenAddress localhost" >> $sshd_config
}
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
function Init() {
	if [ $EUID -ne 0 ]; then
		echo "Run this script as root or sudo user!"
		UserAction
	else
		RootAction
	fi
}
function Daemon() {

	while [ true ]; do

		//code

	done

}
function Status() {
	echo "staus"
	DebugCheckDir /opt/plug

}
function Version() {
	echo "# plug v0.0.1 - invidec.net"
}
function Help() {
	echo "plug <command>"
	echo ""
	echo "available commands:"
	echo "	help	> shows this info"
	echo "	version	> shows version"
	echo "	init	> initializing installation"
	echo "	daemon	> runs the daemon "
}
case $1 in
	init) Init;;
	daemon) Daemon;;
	status) Status;;
	version|-v) Version;;
	help|*) Help;;
esac
