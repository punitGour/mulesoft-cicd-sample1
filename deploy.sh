#!/bin/bash

WORKERSIZE_DEV=0.2
WORKERSIZE_UAT=0.2
WORKERSIZE_PROD=0.2

PROPERTY_DEV="mule.env:dev"
PROPERTY_UAT="mule.env:uat"
PROPERTY_PROD="mule.env:prod"

APP_NAME_DEV="forevernewwhorders1_dev"
APP_NAME_UAT="forevernewwhorders1_uat"
APP_NAME_PROD="forevernewwhorders1_prod"


if [ $1 = DEV ]
then
  echo "Dev initiated" 
  echo 'anypoint-cli --username=$2 --password=$3 --environment="UAT" runtime-mgr cloudhub-application modify --runtime "3.9.4" --workerSize $WORKERSIZE_DEV --property $PROPERTY_DEV $APP_NAME_DEV "/var/lib/jenkins/workspace/forevernew-wh-orders/target/wh_orders_process_api-1.0.0-SNAPSHOT.zip"'



elif [ $1 = UAT ]
then
   echo "Uat initiated"
   echo 'anypoint-cli --username=$2 --password=$3 --environment="UAT" runtime-mgr cloudhub-application modify --runtime "3.9.4" --workerSize $WORKERSIZE_UAT --property $PROPERTY_UAT $APP_NAME_UAT "/var/lib/jenkins/workspace/forevernew-wh-orders/target/wh_orders_process_api-1.0.0-SNAPSHOT.zip"'


elif [ $1 = PROD ]
then
   echo " Prod initiated"
   echo 'anypoint-cli --username=$2 --password=$3 --environment="UAT" runtime-mgr cloudhub-application modify --runtime "3.9.4" --workerSize $WORKERSIZE_PROD --property $PROPERTY_PROD $APP_NAME_PROD "/var/lib/jenkins/workspace/forevernew-wh-orders/target/wh_orders_process_api-1.0.0-SNAPSHOT.zip"'
   
else
echo "select an env"
fi
