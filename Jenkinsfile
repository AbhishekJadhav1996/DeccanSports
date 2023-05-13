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
maven "Maven-linux"
jdk "Jdk"
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



//         stage('Sonar Analysis') {
//             steps {
//                 // use the SonarQube Scanner to analyze the project
//                 withSonarQubeEnv('SONAR-SCANNER') {
//                     sh 'mvn sonar:sonar'
//                 }
//             }
//         }



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
docker.build("docker-soham/sportsclub:${TAG}")
}
}
 }
 stage('Pushing Docker Image to Jfrog Artifactory') {
 steps {
script {
docker.withRegistry('http://172.27.59.80:8082/', 'artifactory-docker') {
 docker.image("docker-soham/sportsclub:${TAG}").push()
docker.image("docker-soham/sportsclub:${TAG}").push("latest")
 }
}
}
}
stage('Deploy'){
steps {
 sh "docker stop sportsclub-soham | true"
sh "docker rm sportsclub-soham | true"
 sh "docker run --network springboot-mysql-net --name sportsclub-soham -p 8083:8080 -d docker-soham/sportsclub:${TAG}"
}
}



}
 // post{
 // always {
 // jiraSendBuildInfo site: 'sohamparikjira.atlassian.net', branch: 'CP-13-Integrate-Jira-with-confluence'
 // }
 // }
}
