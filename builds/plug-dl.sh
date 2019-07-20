#!/bin/bash

 
gitURL="http://gitlab.invidec.net:3000/dave0x3e/plug"

# dlsUrl="http://gitlab.invidec.net:3000/dave0x3e/plug/raw/master/builds/plug-dl.sh"
# pkgUrl="$gitURL/raw/master/builds/plug.tar"

pkgURL="http://ip18.invidec.net/plug/plug.tar"

installPath=/opt/plug
#!/bin/bash

 

dlbasePath=$(pwd)
 
echo "$dlbasePath"

tempDir=$(mktemp -d)

cd $tempDir


pwd
ls -la

wget $pkgURL

tar -vxf plug.tar 

if [ ! -d $installPath ]; then
	mkdir $installPath
fi
