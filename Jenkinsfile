pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t myapp .'
            }
        }

        stage('Test') {
            steps {
                bat 'docker run myapp'
            }
        }

        stage('Deploy') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed ❌'
        }
    }
}
