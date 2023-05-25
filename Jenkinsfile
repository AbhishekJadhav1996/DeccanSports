// comment updated
pipeline {
environment {
 DATE = new Date().format('yy.M')
TAG = "${DATE}.${BUILD_NUMBER}"
 }
agent {
label 'abhishek_node'
 }
 tools {
maven "Maven"
jdk "JDK11"
//         git "Linux-Git"
}
 stages {
//         stage('Checkout') {
//              steps {
//                  checkout scmGit(branches: [[name: '*/develop']], extensions: [], gitTool: 'Linux-Git', userRemoteConfigs: [[url: 'https://github.com/sohampa/Deccan_Sport_Club.git']])
//              }
//         }
stage('validate'){
steps{
 echo "VALIDATE"
sh "mvn clean validate"
}



}



stage('compile'){
steps{
echo "COMPILE"
sh "mvn clean compile"
 }
}



stage('test'){
steps{
echo "Test"
 sh "mvn clean test"
}
}



stage('Sonar Analysis') {
 steps {
 // use the SonarQube Scanner to analyze the project
//                 withSonarQubeEnv('SONAR-SCANNER') {
//                     sh 'mvn sonar:sonar'
 sh 'mvn clean install'
 sh 'mvn sonar:sonar -Dsonar.token=af3b59537694ad9f2ebec5be3b257e82268e0c6d'
//                 }
 }
 }



 stage('package'){
steps{
 echo 'Pakage'
 sh 'mvn clean package'
}
}




stage('install'){
steps{
echo "Install"
sh "mvn clean install"
 }
}
 stage('Docker Build') {
steps {
script {
docker.build("docker-abhishek/sportsclub:${TAG}")
}
}
 }
 stage('Pushing Docker Image to Jfrog Artifactory') {
 steps {
script {
docker.withRegistry('http://172.27.59.80:8082/', 'artifactory-docker') {
 docker.image("docker-abhishek/sportsclub:${TAG}").push()
docker.image("docker-abhishek/sportsclub:${TAG}").push("latest")
 }
}
}
}
stage('Deploy'){
steps {
 sh "docker stop sportsclub-abhishek | true"
sh "docker rm sportsclub-abhishek | true"
 sh "docker run --network abhishek-springboot --name sportsclub-abhishek -p 8089:8080 -d docker-abhishek/sportsclub:${TAG}"
}
}



}
 // post{
 // always {
 // jiraSendBuildInfo site: 'sohamparikjira.atlassian.net', branch: 'CP-13-Integrate-Jira-with-confluence'
 // }
 // }
}
