pipeline {
    agent 'any'
    tools {
            maven 'Maven'
            jdk 'JDK17'
    }

    stages {
        stage('validate') {
            steps {
                echo 'VALIDATE'
                bat 'mvn clean validate'
            }
        }
        stage('Compile') {
            steps {
                echo 'COMPILE'
                sh 'mvn clean compile'
            }
        }

    }
}
