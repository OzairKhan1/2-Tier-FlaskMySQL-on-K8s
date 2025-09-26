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
                        sh "docker tag ozairkhan1/flask-mysql-app:v14 ${IMAGE_NAME}/v${BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Pushing the Docker Image to DockerHub') {
            steps {
                script {
                    dockerPush("${IMAGE_NAME}:v${BUILD_NUMBER}", "dockerHub-cred")
                }
            }
        }

        stage('Updating the Github Manifest File') {
            steps {
                script {
                    dir("Kubernetes") {
                        sh """
                            sed -i "s|\\(image: ${IMAGE_NAME}:\\).*|\\1v${BUILD_NUMBER}|" app-deployment.yml
                        """
                    }
                }
            }
        }

        stage('Pushing the changes into manifest file') {
            steps {
                script {
                        gitPush(
                            "https://github.com/OzairKhan1/2-Tier-FlaskMySQL-on-K8s.git",
                            "main",
                            "gitHub-Cred",
                            "Automated From Jenkins v${BUILD_NUMBER}"
                        )
                }
            }
        }
        
        
    }
    emailNotify()
}
