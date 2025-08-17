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
    }
}