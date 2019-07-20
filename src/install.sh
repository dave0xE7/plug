#!/bin/bash

 

dlbasePath=$(pwd)
 
echo "$dlbasePath"

tempDir=$(mktemp -d)

cd $tempDir


pwd
ls -la

wget $pkgURL

tar -vxf plug.tar 

if [ ! -d $installPath ]; then
	mkdir $installPath
fi
