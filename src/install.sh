#!/bin/bash

 

dlbasePath=$(pwd)
 
echo "$dlbasePath"

wget $pkgUrl

tar -vxf plug.tar
