pipeline {
    agent any

    stages {
        stage('Cleanup Old Container') {
            steps {
                sh '''
                docker rm -f todo-container || true
                docker rmi -f todo-app || true
                '''
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t todo-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name todo-container -p 8000:8000 todo-app'
            }
        }
    }
}
