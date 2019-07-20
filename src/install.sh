#!/bin/bash

 

dlbasePath=$(pwd)
 
echo "$dlbasePath"

wget $pkgURL

tar -vxf plug.tar /.
