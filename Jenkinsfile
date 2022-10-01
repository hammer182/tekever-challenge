pipeline {

    environment {
        dockerimagename = "maarcoalr/tekever_challenge"
        dockerImage = ""
    }

    agent any

    stages{
        stage('Fetch code') {
            steps {
                git branch: 'main', url: 'https://github.com/hammer182/tekever-challenge'
            }
        }

        stage('Build Docker Image') {
            steps{
                script{
                    dockerImage = docker.build dockerimagename
                }
            }
        }

        stage('Push image to DockerHub') {
            environment {
                registryCredential = 'dockerhub'    
            }
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy to Kubernetes Cluster') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment-tekever-challenge.yml", kubeconfigId: "kubernetes")
                    kubernetesDeploy(configs: "statefulset-sistema-noticias.yml", kubeconfigId: "kubernetes")
                    kubernetesDeploy(configs: "svc-tekever-challenge.yml", kubeconfigId: "kubernetes")
                }
            }
        }
    }
}