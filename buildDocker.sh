#!/bin/bash
#build mockserver with admin UI and package a war file.

buildScriptPath="`( cd \"$(dirname $0)\" && pwd )`" 
push=false

function help(){

   echo -e "./buildDocker.sh [options] "
   echo -e "\t -h help infomation "
   echo -e "\t -v <versionName> specify the version you want,default will be master "
   exit 0

}


while getopts "hv:p" opt; do
  case ${opt} in
    h ) # process option h
        help
      ;;
    v ) # process option v
       version=$OPTARG
      ;;
    p ) # process option h
       push=true 
      ;;
    \? )
       help
       exit 1
      ;;
  esac
done


if [[ ! -d ../mockServer ]]
then
    echo "mockServer is not found"
    exit -1
fi

cp ../mockServer/target/*.war dockfile/hissummer-mockserver.war

if [[ $? -ne 0 ]]
then
   echo "cp war error, please check war is exist or not"
   exit -1 
fi
cd dockfile
sudo docker build -t nighteblis/hissummer-mockserver:${version} . && sudo docker build -t nighteblis/hissummer-mockserver:latest .

if $push
then

    sudo docker push nighteblis/hissummer-mockserver:${version} && sudo docker push nighteblis/hissummer-mockserver:latest
fi
