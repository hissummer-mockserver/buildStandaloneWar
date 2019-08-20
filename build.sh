#!/bin/bash
cd ../mockserverAdminUI
git pull
yarn build
mkdir -p ../mockserver/src/main/resource/static
cp -rf dist/* ../mockserver/src/main/resources/static
mkdir -p ../mockserver/src/main/webapp/templates/
cp -rf dist/index.html ../mockserver/src/main/webapp/templates/
cd ../mockserver
git pull
mvn versions:set -DnewVersion=0.0.2-alpha
mvn clean package -Dmaven.test.skip=true
cp -f ../mockserver/target/*.war ../StandaloneJar
