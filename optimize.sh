#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/build"
sourcePath="$basePath/src"

for bashfile in src/*.sh; do

	echo "file $bashfile"
	#cp $bashfile $bashfile.bu
	cat $bashfile | tr -d "\r" > $bashfile.opt
	rm $bashfile
	mv $bashfile.opt $bashfile
done

