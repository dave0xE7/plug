#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/build"
sourcePath="$basePath/src"

version=$(cat $buildPath/version)
echo "last version was $version"

((version++))
echo "new version is $version"
echo $version > $buildPath/version

cat $sourcePath/config.sh > $buildPath/plug.sh
echo "version=$version" >> $buildPath/plug.sh
cat $sourcePath/common.sh >> $buildPath/plug.sh
cat $sourcePath/main.sh >> $buildPath/plug.sh

echo "$buildPath"
ls $buildPath
