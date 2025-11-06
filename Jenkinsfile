pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t kube:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Docker image...'
                sh 'docker images | grep kube'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Example deployment step (you can adjust if using Minikube)
                sh 'echo "Deploying to Kubernetes..."'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully ✅'
        }
        failure {
            echo 'Pipeline failed ❌'
        }
    }
}
