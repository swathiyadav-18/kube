pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Build') {
            steps {
                echo '🔧 Building Docker image...'
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running container test...'
                bat 'docker run --rm -d -p 3000:3000 --name myapp_test %IMAGE_NAME%:%IMAGE_TAG%'
                bat 'docker ps'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo '🚀 Deploying to Kubernetes...'
                bat 'kubectl apply -f my-kube1-deployment.yaml'
                bat 'kubectl apply -f my-kube1-service.yaml'
            }
        }
    }

    post {
        success {
            echo '✅ CI/CD pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Please check the logs.'
        }
    }
}
