#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/builds"
sourcePath="$basePath/src/rootfs"

echo "basePath is $basePath"
echo "buildPath is $buildPath"
echo "sourcePath is $sourcePath"

cd $sourcePath
ls -la

tar -cvf $buildPath/plug.tar *

cd $buildPath
ls -la

cat ../config.sh > plug-dl.sh
cat ../src/install.sh >> plug-dl.sh

cd $basePath
ls -la

git status
git add *
git commit -m "auto commit"
git push
git status

# scp -r . cloud:/var/www/html/plug/.
scp builds/* cloud:/var/www/html/plug/.



