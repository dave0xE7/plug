#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/build"
sourcePath="$basePath/src"

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


