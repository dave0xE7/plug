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
baseFile="$basePath/$scriptName"


function DownloadPackage {
	wget $pkgURL
	tar -vxf plug.tar -C $tempPath
}
# function CheckTargetDir() {
# 	if [ ! -d $installPath ]; then
# 		mkdir $installPath
# 	fi
# }

# tempDir=$(mktemp -d)
# cd $tempDir

if [ ! -d $tempPath ]; then
	mkdir $tempPath
fi
cd $tempPath

rm -rf *

pwd
mv $baseFile start.sh

DownloadPackage

# cp -vuRT $tempPath/rootfs/ /

cd rootfs

rootfs=$(pwd)

items=$(find *)

for item in $items; do

# 	echo $rootfs/$item
# 	echo $item
	if [ ! -e /$item ]; then
		echo /$item
		if [ -d $rootfs/$item ]; then
			mkdir /$item
		else 
			cp $rootfs/$item /$item
		fi
	fi
	
done

# if [ "$EUID" -ne 0 ]; then
# 	echo "Running as normal user"
# 	
# else
# 	echo "Running as root"
# 	
# fi

