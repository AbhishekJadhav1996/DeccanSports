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

        // stage('test') {
        //     steps {
        //         echo 'Test'
        //         sh 'mvn clean test'
        //     }
        // }

        // stage('Sonar Analysis') {
        //     steps {
        //         sh 'mvn clean install'
        //         sh 'mvn sonar:sonar -Dsonar.token=cbf4cb8304fee53bde54f1d6a2273f35b5afe9fd'
        //     }
        // }

        stage('package') {
