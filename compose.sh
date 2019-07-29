#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/build"
sourcePath="$basePath/src"

version=$(cat $buildPath/version)
echo "last version was $version"

((version++))
echo "new version is $version"
echo $version > $buildPath/version


tr -d "\r" < $sourcePath/main.sh > $buildPath/plug.sh

ls $buildPath
