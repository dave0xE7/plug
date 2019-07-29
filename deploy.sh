#!/bin/bash

basePath=$(pwd)

buildPath="$basePath/build"
sourcePath="$basePath/src"

git status
git add *
git commit -m "auto commit"
git push origin
git push public
git status


# DEPLOYMENT OF BUILD FILES TO CLOUD SERVER
# http download location

# scp -r . cloud:/var/www/html/plug/.
# scp builds/* cloud:/var/www/html/plug/.

#rsync -v -r  ./* cloud:/var/www/html/plug/

ssh cloud cd /var/www/html/plug && git pull
