pipeline {
    agent any
    
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
        jdk "JAVA_HOME"
    }

 
    stages {
       // stage("git pull"){
         //   steps{
                //git 'https://github.com/ForeverNewAWS/forevernew-wh-orders-api-v2'
           //     git branch: 'main',
             //   credentialsId: 'githubcred',
               // url: 'https://github.com/punitGour/jenkinsDemo.git'
            // }
       // }
        stage('build with parameter'){
            steps {
                script{
                    properties([parameters([[$class: 'ChoiceParameter', choiceType: 'PT_SINGLE_SELECT', description: '', filterLength: 1, filterable: false, name: 'env', randomName: 'choice-parameter-4017106827748', script: [classpath: [], sandbox: false, script: '''return [
\'DEV\' ,
\'UAT\' ,
\'PROD\'
]
if (env.equals ("DEV")){
    return ["DEV"]
}
else if(env.equals("UAT")){
return ["UAT"]
}

 

else if(env.equals("PROD")){
return ["PROD"]
}
else {
    return ["select parameter from dropdown"]
    }''']]]]))
                }
            }
        }
         stage('Build') {
             steps {
                 // Get some code from a GitHub repository
                 sh 'mvn clean package'
            }
        }
        stage(' Deploy') {
             environment {
             CLOUDHUB=credentials('githubcred')
          }
             steps {
                 
                 sh 'chmod 777 deploy.sh'
                 sh './deploy.sh $env $CLOUDHUB_USR $CLOUDHUB_PSW'
             // Get some code from a GitHub repository
             //sh 'mvn deploy -P cloudhub -Dmule.version=3.9.4 -Danypoint.username={your username} -Danypoint.password={your password}'
                
                //sh 'mvn clean package mule:deploy  -P cloudhub -Dusername=$CLOUDHUB_USR -Dpassword=$CLOUDHUB_PSW -X -e'    
                //sh 'anypoint-cli --username=$CLOUDHUB_USR --password=$CLOUDHUB_PSW --environment="UAT" runtime-mgr cloudhub-application modify --runtime "3.9.4" --workerSize "0.2" --property "mule.env:dev" "forevernewwhorders1" "/var/lib/jenkins/workspace/forevernew-wh-orders/target/wh_orders_process_api-1.0.0-SNAPSHOT.zip"'

 

             }
        }
    }
}
