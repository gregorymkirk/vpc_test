pipeline {
    agent any 
    stages {
        stage('Stage Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/gregorymkirk/vpc_test.git']]])
            }
        stage('Stage plan') {
            steps {

            }
                
        }

        stage('Stage apply') {
            steps {
            	sh 
            }
                
        }
    }
}