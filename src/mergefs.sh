#!/bin/bash



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
