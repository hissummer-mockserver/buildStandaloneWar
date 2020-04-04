#!/bin/bash
#
#build mockserver with admin UI and package a war file.
#

buildScriptPath="`( cd \"$(dirname $0)\" && pwd )`" 

function checkCommand(){

   type $0 &>/dev/null

    if [[ $? -ne 0 ]] 
    then
        echo "$0 not found!"
        exit 2
    fi

}

function help(){

   echo -e "build.sh [options] "
   echo -e "\t -h help infomation "
   echo -e "\t -v specify the version you want,default will be master "
   exit 0

}

version="master"
deploy=false

while getopts "hv:d" opt; do
  case ${opt} in
    h ) # process option h
        help
      ;;
    v ) # process option v 
       version=$OPTARG    
      ;;
    d ) # 
       deploy=true   
      ;;
    \? ) 
       help
       exit 1 
      ;;
  esac
done

checkCommand "git"
checkCommand "yarn"
checkCommand "node"
checkCommand "mvn"


if [[ ! -d ../mockserverAdminUI ]]
then 
    git clone git@github.com:hissummer-mockserver/mockserverAdminUI.git ../mockserverAdminUI 
fi

if [[ ! -d ../mockServer ]]
then 
    git clone  git@github.com:hissummer-mockserver/mockServer.git ../mockServer
fi


cd ../mockserverAdminUI
git pull
yarn build
mkdir -p ../mockServer/src/main/resource/static
cp -rf dist/* ../mockServer/src/main/resources/static
mkdir -p ../mockServer/src/main/webapp/templates/
cp -rf dist/index.html ../mockServer/src/main/webapp/templates/
cd ../mockServer
git pull

mvn versions:set -DnewVersion=${version}

if $deploy
then 
    mvn clean deploy -Dregistry=https://maven.pkg.github.com/hissummer-mockserver -Dmaven.test.skip=true
fi

