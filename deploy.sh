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

sh 'anypoint-cli'
