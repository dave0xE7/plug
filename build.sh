#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/builds"
sourcePath="$basePath/src"

# echo "basePath is $basePath"
# echo "buildPath is $buildPath"
# echo "sourcePath is $sourcePath"

# cd $sourcePath
# ls -la

# Building a TAR Package File
# tar -cvf $buildPath/plug.tar *

# cd $buildPath
# ls -la

# cat ../config.sh > plug-dl.sh
cat $sourcePath/core.sh > $buildPath/plug.sh

# cd $basePath
# ls -la

# UPDATING THE GIT REPOSITORY

git status
git add *
git commit -m "auto commit"
git push
git status


# DEPLOYMENT OF BUILD FILES TO CLOUD SERVER
# http download location

# scp -r . cloud:/var/www/html/plug/.
# scp builds/* cloud:/var/www/html/plug/.

rsync -v -r  ./* cloud:/var/www/html/plug/


