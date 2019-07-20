 
gitURL="http://gitlab.invidec.net:3000/dave0x3e/plug"

dlsUrl="$gitURL/raw/master/builds/plug-dl.sh"
pkgUrl="$gitURL/raw/master/builds/plug.tar"
#!/bin/bash

 

dlbasePath=$(pwd)
 
echo "$dlbasePath"

tar -vxf plug.tar
