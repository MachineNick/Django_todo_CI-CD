pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/MachineNick/Django_todo_CI-CD.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the Django app..."
                sh 'python3 -m pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'python3 manage.py test'
            }
        }
    }
}
