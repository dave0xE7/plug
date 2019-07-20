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

cd $basePath
ls -la

git status
git add *
git commit -m "auto commit"
git push
git status
