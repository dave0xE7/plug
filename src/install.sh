#!/bin/bash


#	Copyright 2019 INVIDEC.NET
#	
#	This File is Part of the PLUG Project

# config
pkgURL="http://ip18.invidec.net/plug/plug.tar"
#
tempPath=/tmp/plug
installPath=/opt/plug
#

basePath=$(pwd)
scriptName=$0
baseFile="$basePath$scriptName"


function DownloadPackage() {
	wget $pkgURL
	tar -vxf plug.tar -C /
}
function CheckTargetDir() {
	if [ ! -d $installPath ]; then
		mkdir $installPath
	fi
}

tempDir=$(mktemp -d)
cd $tempDir

pwd
mv $baseFile start.sh

DownloadPackage

if [ "$EUID" -ne 0 ]
	then echo "Running as normal user"
	
else
	echo "Running as root"
	
fi

