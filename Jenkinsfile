pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running container test...'
                // This will run the app and immediately stop if it exits
                bat 'docker run --rm -d -p 3000:3000 --name myapp_test %IMAGE_NAME%:%IMAGE_TAG%'
            }
        }

        stage('Push to Registry (optional)') {
            when {
                expression { return false } // change to true if you configure Docker Hub
            }
            steps {
                echo 'Pushing image to Docker Hub...'
                bat 'docker tag %IMAGE_NAME%:%IMAGE_TAG% your-dockerhub-username/%IMAGE_NAME%:%IMAGE_TAG%'
                bat 'docker push your-dockerhub-username/%IMAGE_NAME%:%IMAGE_TAG%'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
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
            echo '❌ Pipeline failed. Check logs for details.'
        }
    }
}
