fx=`cat cloud.deployment | grep $1`
for filename in $fx
do
fx1=`echo $filename | cut -f1 -d ','`
fx2=`echo $filename | cut -f2 -d ','`
fx3=`echo $filename | cut -f3 -d ','`
fx4=`echo $filename | cut -f4 -d ','`
done

sh 'anypoint-cli --username=$2 --password=$3 --environment=$1 runtime-mgr cloudhub-application modify --runtime "3.9.4" --workerSize $WORKERSIZE_ENV --property $PROPERTY_ENV $APP_NAME_ENV "/var/lib/jenkins/workspace/forevernew-wh-orders/target/wh_orders_process_api-1.0.0-SNAPSHOT.zip"'
