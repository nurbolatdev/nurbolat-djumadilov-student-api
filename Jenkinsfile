pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Nurbolat Djumadilov'
        IMAGE_NAME   = 'nurbolat-djumadilov-student-api'
        IMAGE_TAG    = 'v1.0-nurbolat-djumadilov'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME} - checking out source code"
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean build -x test --no-daemon'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test --no-daemon'
            }
            post {
                always {
                    junit 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} > /dev/null"
                sh "docker images ${IMAGE_NAME}:${IMAGE_TAG}"
                echo "Image ${IMAGE_NAME}:${IMAGE_TAG} built successfully by ${STUDENT_NAME}"
            }
        }
    }

    post {
        success { echo "Pipeline SUCCESS - ${STUDENT_NAME}" }
        failure { echo "Pipeline FAILED - ${STUDENT_NAME}. Check Build/Test stage logs." }
    }
}
