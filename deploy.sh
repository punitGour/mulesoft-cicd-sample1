#!/bin/bash

fx=`cat cloud.deployment | grep $1`
for filename in $fx
do
env=`echo $filename | cut -f1 -d ','`
core=`echo $filename | cut -f2 -d ','`
version=`echo $filename | cut -f3 -d ','`
property=`echo $filename | cut -f4 -d ','`
AppName=`echo $filename | cut -f5 -d ','`
done




echo $env
echo $core
echo $version
echo $property

anypoint-cli --username=$2 --password=$3 --environment=$env runtime-mgr cloudhub-application deploy --runtime $version --workerSize $core $4 /var/lib/jenkins/workspace/forever-new/target/*.jar||anypoint-cli --username=$2 --password=$3 --environment=$env runtime-mgr cloudhub-application modify --runtime $version --workerSize $core $4 /var/lib/jenkins/workspace/forever-new/target/*.jar
