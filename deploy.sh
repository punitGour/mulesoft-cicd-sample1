#!/bin/bash

fx=`cat cloud.deployment | grep $1`
for filename in $fx
do
env=`echo $filename | cut -f1 -d ','`
core=`echo $filename | cut -f2 -d ','`
version=`echo $filename | cut -f3 -d ','`
fx4=`echo $filename | cut -f4 -d ','`
done

echo $env
echo $core
echo $version
echo $fx4


anypoint-cli --username=$2 --password=$3 --environment="Sandbox" runtime-mgr cloudhub-application modify --runtime "4.2.2" --workerSize "0.2" --property "mule.env:dev" "helloworld-pradeeppriya" "/var/lib/jenkins/workspace/forever-new/target/mulesoft-cicd-sample1-1.0.0-SNAPSHOT-mule-application.jar"
