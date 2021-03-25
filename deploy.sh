fx=`cat cloud.deployment | grep $1`
for filename in $fx
do
env=`echo $filename | cut -f1 -d ','`
core=`echo $filename | cut -f2 -d ','`
version=`echo $filename | cut -f3 -d ','`
fx4=`echo $filename | cut -f4 -d ','`
done

sh 'anypoint-cli --username=$2 --password=$3 --environment=$env runtime-mgr cloudhub-application modify --runtime $version --workerSize $WORKERSIZE_ENV --property $PROPERTY_ENV $APP_NAME_ENV "/var/lib/jenkins/workspace/forevernew-build-24/target/mulesoft-cicd-sample1-1.0.0-SNAPSHOT-mule-application.jar"'
