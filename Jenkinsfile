pipeline {
    agent {
        label 'linux'
    }
    tools {
            maven 'Maven'
            jdk 'JDK11'
    }

    stages {
        stage('validate') {
            steps {
                echo 'VALIDATE'
                sh 'mvn clean validate'
            }
        }
        stage('Compile') {
            steps {
                echo 'COMPILE'
                sh 'mvn clean compile'
            }
        }
      stage('package') {
            steps {
                echo 'Pakage'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
                steps {
                    sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                }
        }
        stage('scan') {
            steps { 
                sh 'trivy image abhi_patil/sportclub-backend:latest'
            }
        }
    }
}
