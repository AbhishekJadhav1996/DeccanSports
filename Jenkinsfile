
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
        }
    agent {
        label 'Abhishek_Staging_Node'
    }
    tools {
        maven "Maven"
        jdk "JDK11"
    }
    stages {
        stage('validate'){
            steps{
                echo "VALIDATE"
                bat "mvn clean validate"
            }
        }

        stage('compile'){
            steps{
                echo "COMPILE"
                bat "mvn clean compile"
            }
        }

        stage('test'){
            steps{
                echo "Test"
                bat "mvn clean test"
            }
        }
        stage('Sonar Analysis') {
            steps {
        withSonarQubeEnv('SonarQube') {
        bat 'mvn sonar:sonar'
            bat 'mvn clean install'
            // bat 'mvn sonar:sonar -Dsonar.token=af3b59537694ad9f2ebec5be3b257e82268e0c6d'
            }
        }
        }

        stage('package'){
            steps{
                echo 'Pakage'
                bat 'mvn clean package'   
            }
        }

 
        stage('install'){
            steps{
                echo "Install"
             bat "mvn clean install"
            }
        }
 
        stage('Docker Build') {
             when {
                branch 'release'
            }
             steps {
                 script{
                     docker.build("docker-abhishek/sportsclub:${TAG}")}

                 }
             }

            stage('Pushing Docker Image to Jfrog Artifactory') {
                 when {
                branch 'release'
            }
             steps {
                 script{
                     docker.withRegistry('http://172.27.59.80:8082/', 'artifactory-docker') {
                     docker.image("docker-abhishek/sportsclub:${TAG}").push()
                     docker.image("docker-abhishek/sportsclub:${TAG}").push("latest")
                     }
                 }
                 }
             }

        stage('Deploy'){
             when {
                branch 'release'
            }
             steps {
                    sh "docker compose down"
                    sh "docker compose up -d"
                 }
     }
    }
}
 
