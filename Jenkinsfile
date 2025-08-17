pipeline {
    agent any

    stages{
        stage('Checkout'){
            steps{

                 git branch: "${env.BRANCH_NAME}", url: 'https://github.com/Nandoo-03/Final-Project.git'
            }
        }
        stage('Build'){
            steps{
                script {
                    echo "Building the Docker image based on the branch..."
                    sh 'chmod +x build.sh && ./build.sh'
                }

            }
        }
        stage('Push to DockerHub'){
            steps{
                script {
                    echo "Pushing the Docker image to DockerHub on the branch..."
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker push nandoo03/dev:latest'
                    } else if (env.BRANCH_NAME == 'master') {
                        sh 'docker push nandoo03/prod:latest'
                    }
                }
            }
        }
    }
}