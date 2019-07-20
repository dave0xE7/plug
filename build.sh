#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/builds"
sourcePath="$basePath/src/rootfs"

echo "basePath is $basePath"
echo "buildPath is $buildPath"
echo "sourcePath is $sourcePath"

echo "going to $sourcePath"
cd $sourcePath

tar -cvf $buildPath/plug.tar *

cd $buildPath
pwd
ls
