pipeline {
    agent any
    environment {
    DOCKERHUB_CREDENTIALS = credentials('DockerSecuirtyKey')
     }
     
    stages{
        stage('Setup parameters') {
            steps {
                script { 
                    properties([
                        parameters([
                            string(
                                defaultValue: 'v1', 
                                name: 'IMAGE_VERSION', 
                                trim: true
                            )
                        ])
                    ])
                }
            }
        }
        stage('Checkout SCM') {
            steps {
                checkout([
                 $class: 'GitSCM',
                 userRemoteConfigs: [[
                    url: 'https://github.com/saikumarsmh/Capstone.git',
                    credentialsId: 'githubid',
                 ]]
                ])
            }
        }
        /*stage('start'){
            steps{
               // git 'https://github.com/saikumarsmh/Capstone.git'
              //  sh 'npm install'
            }
        }*/
       /* stage('run build.sh'){
            steps{
                  sh 'pwd'
                 sh '$USER'
                 sh 'chmod +x ./build.sh'
                 sh 'sudo docker build -t reactapp:$IMAGE_VERSION .'
                 sh './build.sh'
            }
        }*/
        stage('push Dev Repo'){
             /*when {
              expression { BRANCH_NAME == 'dev' }
            }*/
            when {
                branch 'dev' 
            }

            steps{
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                 sh  'sudo docker build -t reactapp:$IMAGE_VERSION .'
                 sh 'sudo docker tag reactapp:$IMAGE_VERSION saidevops22/reactdev:$IMAGE_VERSION'
                 sh 'pwd'
                 sh 'sudo docker push saidevops22/reactdev:$IMAGE_VERSION'
           
            }
        }
        stage('push Prod repo'){
           /* when {
              expression { BRANCH_NAME == 'master' }
            }*/
            when {
                branch 'master' 
            }
            steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                 sh 'sudo docker tag reactapp:$IMAGE_VERSION saidevops22/reactdev:$IMAGE_VERSION'
                 sh 'sudo docker push saidevops22/reactdev:$IMAGE_VERSION'
                    
            }
        }    
    }
}
