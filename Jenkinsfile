@Library('jShrLibs') _

pipeline {
    agent { label 'docNode' }

    environment {
        IMAGE_NAME = "ozairkhan1/flask-mysql-app"
    }

    stages {
        stage('Git Cloning') {
            steps {
                script {
                    gitClone("https://github.com/OzairKhan1/2-Tier-FlaskMySQL-on-K8s.git", "main")
                }
            }
        }

        stage('Building the Docker Image') {
            steps {
                script {
                    dir("DkrFiles") {
                        //sh "docker build -t ${IMAGE_NAME}/v${BUILD_NUMBER} ."
                        sh "docker tag ${IMAGE_NAME}:v50 ${IMAGE_NAME}:v${BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Pushing the Docker Image to DockerHub') {
            steps {
                script {
                    dockerPush("${IMAGE_NAME}:v${BUILD_NUMBER}", "dockerHub")
                }
            }
        }
    }

    post {
        success {
            build job: 'updateManifst-deployArgoCd',
                  parameters: [
                      string(name: 'BUILD_NUMBER', value: "${BUILD_NUMBER}")
                  ]
        }
    }
}

