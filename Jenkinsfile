pipeline {
    agent any

    environment {
        IMAGE_NAME = 'demo-app'
        CONTAINER_NAME = 'demo-app-container'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub via SSH
                git branch: 'master', url: 'git@github.com:vaibhavcheif/Jenkins-Project.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop and remove existing container if running
                sh 'docker rm -f $CONTAINER_NAME || true'
                // Run new container
                sh 'docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }

        stage('Check Logs') {
            steps {
                sh 'docker logs $CONTAINER_NAME'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

