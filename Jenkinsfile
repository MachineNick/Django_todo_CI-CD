pipeline {
    agent any

    stages {
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

        stage('Apply Migrations') {
            steps {
                sh 'docker exec todo-container python manage.py migrate'
            }
        }

        stage('Collect Static') {
            steps {
                sh 'docker exec todo-container python manage.py collectstatic --noinput'
            }
        }
    }
}
